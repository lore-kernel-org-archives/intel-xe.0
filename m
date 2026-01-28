Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0BBD35691
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 08:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E6E10E2AF;
	Wed, 28 Jan 2026 08:39:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E43210E27B;
 Wed, 28 Jan 2026 08:38:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4238030798801205817=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/multi=5Fqueue=3A_Pr?=
 =?utf-8?q?otect_priority_against_concurrent_access_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jan 2026 08:38:59 -0000
Message-ID: <176958953931.199106.15935535438284100930@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260126174241.3470390-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260126174241.3470390-2-niranjana.vishwanathapura@intel.com>
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

--===============4238030798801205817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/multi_queue: Protect priority against concurrent access (rev5)
URL   : https://patchwork.freedesktop.org/series/160447/
State : success

== Summary ==

CI Bug Log - changes from xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1_FULL -> xe-pw-160447v5_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-160447v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1407])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1124])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#2887])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][4] ([Intel XE#6968]) +3 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-edp-1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#656]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#1503])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#7130] / [Intel XE#7131])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7130]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#7131]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1406])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3414] / [Intel XE#3904])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic@pipe-b-dp-2:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#6361])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-7/igt@kms_setmode@basic@pipe-b-dp-2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-4/igt@kms_setmode@basic@pipe-b-dp-2.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#688])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#7136])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#6874])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#5625])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#4943])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#944])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@xe_query@multigpu-query-pxp-status.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-hang@pipe-a-edp-1:
    - shard-lnl:          [DMESG-WARN][24] ([Intel XE#7063]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-8/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-1/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][26] ([Intel XE#6361]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_setmode@basic@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][28] ([Intel XE#4459]) -> [PASS][29] +1 other test pass
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][30] ([Intel XE#2142]) -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][32] ([Intel XE#6321]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][34] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][35] ([Intel XE#3544])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][36] ([Intel XE#2426]) -> [FAIL][37] ([Intel XE#1729])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][38] ([Intel XE#2509]) -> [SKIP][39] ([Intel XE#2426])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-lnl:          [DMESG-WARN][40] ([Intel XE#4537] / [Intel XE#7063]) -> [DMESG-WARN][41] ([Intel XE#7063])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-8/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-1/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6968]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6968
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1 -> xe-pw-160447v5

  IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1: 6d88e21d3ccde3ca984304cde021744d0e326ee1
  xe-pw-160447v5: 160447v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/index.html

--===============4238030798801205817==
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
<tr><td><b>Series:</b></td><td>drm/xe/multi_queue: Protect priority against concurrent access (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160447/">https://patchwork.freedesktop.org/series/160447/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1_FULL -&gt; xe-pw-160447v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160447v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6968">Intel XE#6968</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-7/igt@kms_setmode@basic@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-4/igt@kms_setmode@basic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@xe_evict@evict-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-8/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-1/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_setmode@basic@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1/shard-lnl-8/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160447v5/shard-lnl-1/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1 -&gt; xe-pw-160447v5</li>
</ul>
<p>IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1: 6d88e21d3ccde3ca984304cde021744d0e326ee1<br />
  xe-pw-160447v5: 160447v5</p>

</body>
</html>

--===============4238030798801205817==--
