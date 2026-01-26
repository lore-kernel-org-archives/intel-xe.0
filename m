Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5BBCF65CB
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 09:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACC310E045;
	Mon, 26 Jan 2026 09:54:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9F510E045;
 Mon, 26 Jan 2026 09:54:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9125163425173182382=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/ptl=3A_Disable_DCC_o?=
 =?utf-8?q?n_PTL_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jan 2026 09:54:25 -0000
Message-ID: <176942126583.192124.17465828652060027364@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260124005917.398522-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260124005917.398522-1-vinay.belgaumkar@intel.com>
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

--===============9125163425173182382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Disable DCC on PTL (rev5)
URL   : https://patchwork.freedesktop.org/series/160388/
State : success

== Summary ==

CI Bug Log - changes from xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9_FULL -> xe-pw-160388v5_FULL
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

  Here are the changes found in xe-pw-160388v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#1124])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2887])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2341])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_content_protection@type1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#656])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2311]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#7061])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7061])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2313])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][9] -> [ABORT][10] ([Intel XE#5175])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - shard-bmg:          [PASS][11] -> [ABORT][12] ([Intel XE#1727])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - shard-bmg:          [PASS][13] -> [INCOMPLETE][14] ([Intel XE#6652])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1439] / [Intel XE#836])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
    - shard-lnl:          [PASS][16] -> [DMESG-WARN][17] ([Intel XE#4537]) +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-lnl-5/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-7/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1499])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#6321])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_multi_queue@many-execs-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6874])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html

  * igt@xe_exec_system_allocator@once-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4943])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_system_allocator@once-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:
    - shard-lnl:          [PASS][23] -> [DMESG-WARN][24] ([Intel XE#7063])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#4943])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap:
    - shard-bmg:          [PASS][26] -> [ABORT][27] ([Intel XE#5545])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2284])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_pm@s3-d3cold-basic-exec.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][29] ([Intel XE#4633]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][31] ([Intel XE#5299]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@xe_vm@large-binds-16777216:
    - shard-bmg:          [INCOMPLETE][33] ([Intel XE#2594]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-7/igt@xe_vm@large-binds-16777216.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_vm@large-binds-16777216.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][35] ([Intel XE#2426]) -> [FAIL][36] ([Intel XE#1729])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836


Build changes
-------------

  * Linux: xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9 -> xe-pw-160388v5

  IGT_8716: 8716
  xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9: a47173257e3d0aeae02f59baad97046bee0b7ce9
  xe-pw-160388v5: 160388v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/index.html

--===============9125163425173182382==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Disable DCC on PTL (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160388/">https://patchwork.freedesktop.org/series/160388/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9_FULL -&gt; xe-pw-160388v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160388v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-lnl-5/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-7/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_system_allocator@once-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-16777216:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-7/igt@xe_vm@large-binds-16777216.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_vm@large-binds-16777216.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9 -&gt; xe-pw-160388v5</li>
</ul>
<p>IGT_8716: 8716<br />
  xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9: a47173257e3d0aeae02f59baad97046bee0b7ce9<br />
  xe-pw-160388v5: 160388v5</p>

</body>
</html>

--===============9125163425173182382==--
