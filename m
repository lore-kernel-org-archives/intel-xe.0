Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A00CDB46F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 16:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3120D10E03B;
	Mon, 22 Jun 2026 16:49:08 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D4410E03B;
 Mon, 22 Jun 2026 16:49:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8025598751973011999=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/guc=3A_Hold_device_?=
 =?utf-8?q?ref_until_queue_teardown_completes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jun 2026 16:49:06 -0000
Message-ID: <178214694684.102380.13153169419331862814@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260622091335.2222655-1-arvind.yadav@intel.com>
In-Reply-To: <20260622091335.2222655-1-arvind.yadav@intel.com>
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

--===============8025598751973011999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Hold device ref until queue teardown completes (rev4)
URL   : https://patchwork.freedesktop.org/series/168424/
State : success

== Summary ==

CI Bug Log - changes from xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294_FULL -> xe-pw-168424v4_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294_FULL and xe-pw-168424v4_FULL:

### New IGT tests (14) ###

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  

Known issues
------------

  Here are the changes found in xe-pw-168424v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1124])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#367])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#2887])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#7571])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2311])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#6312])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-bmg:          [PASS][10] -> [INCOMPLETE][11] ([Intel XE#8368])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#1503])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#7922]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-4/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#7915]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-6/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7636])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@xe_eudebug@basic-exec-queues.html
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#7636])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#8364]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate.html
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#8364]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-media:
    - shard-bmg:          [PASS][22] -> [FAIL][23] ([Intel XE#7850])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-9/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-6/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html

  
#### Possible fixes ####

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][24] ([Intel XE#7949]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          [FAIL][26] ([Intel XE#6266]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][28] ([Intel XE#301]) -> [PASS][29] +2 other tests pass
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][30] ([Intel XE#7915]) -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][32] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@long-spin-many-preempt-threads:
    - shard-bmg:          [FAIL][34] ([Intel XE#7956]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-threads.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-9/igt@xe_exec_reset@long-spin-many-preempt-threads.html

  * igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][36] ([Intel XE#7850]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-5/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-1/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html

  * igt@xe_vm@large-userptr-binds-16777216:
    - shard-lnl:          [ABORT][38] ([Intel XE#8007]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-5/igt@xe_vm@large-userptr-binds-16777216.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@xe_vm@large-userptr-binds-16777216.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [ABORT][40] ([Intel XE#8007]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][42] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][43] ([Intel XE#1729] / [Intel XE#7424])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][44] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][45] ([Intel XE#2426] / [Intel XE#5848])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368


Build changes
-------------

  * Linux: xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294 -> xe-pw-168424v4

  IGT_8976: 8976
  xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294: 55ba13f332ab983d0c3ce0c448d46af3da717294
  xe-pw-168424v4: 168424v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/index.html

--===============8025598751973011999==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Hold device ref until queue teardown completes (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168424/">https://patchwork.freedesktop.org/series/168424/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294_FULL -&gt; xe-pw-168424v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294_FULL and xe-pw-168424v4_FULL:</p>
<h3>New IGT tests (14)</h3>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168424v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-4/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-6/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-media:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-9/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-6/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949">Intel XE#7949</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-9/igt@xe_exec_reset@long-spin-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-5/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-1/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-16777216:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-5/igt@xe_vm@large-userptr-binds-16777216.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-lnl-7/igt@xe_vm@large-userptr-binds-16777216.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-10/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v4/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294 -&gt; xe-pw-168424v4</li>
</ul>
<p>IGT_8976: 8976<br />
  xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294: 55ba13f332ab983d0c3ce0c448d46af3da717294<br />
  xe-pw-168424v4: 168424v4</p>

</body>
</html>

--===============8025598751973011999==--
