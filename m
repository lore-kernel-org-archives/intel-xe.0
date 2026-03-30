Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125F91061B1F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B908F10E468;
	Mon, 30 Mar 2026 20:11:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DC210E468;
 Mon, 30 Mar 2026 20:11:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6439827768393136321=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915=3A_More_uncore_nu?=
 =?utf-8?q?kage_from_display_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Mar 2026 20:11:17 -0000
Message-ID: <177490147776.414218.5323528836803697951@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
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

--===============6439827768393136321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: More uncore nukage from display code (rev2)
URL   : https://patchwork.freedesktop.org/series/163872/
State : success

== Summary ==

CI Bug Log - changes from xe-4820-bd31fb142d057e5995cfeaad45b36e051ccb7ccb_FULL -> xe-pw-163872v2_FULL
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

  Here are the changes found in xe-pw-163872v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2134]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-bmg-5/igt@fbdev@write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#3279])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#2887]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#6974])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#6312] / [Intel XE#651])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#656])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#6703]) +441 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#6901])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#7636])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_exec_balancer@once-parallel-basic:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#7482])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@xe_exec_balancer@once-parallel-basic.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1392])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#7136])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_system_allocator@eu-fault-4k-range-device-host:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#7592])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4820-bd31fb142d057e5995cfeaad45b36e051ccb7ccb/shard-lnl-8/igt@xe_exec_system_allocator@eu-fault-4k-range-device-host.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-5/igt@xe_exec_system_allocator@eu-fault-4k-range-device-host.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#5625])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4820-bd31fb142d057e5995cfeaad45b36e051ccb7ccb/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#6557] / [Intel XE#6703]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#6964]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7592
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636


Build changes
-------------

  * Linux: xe-4820-bd31fb142d057e5995cfeaad45b36e051ccb7ccb -> xe-pw-163872v2

  IGT_8835: 8835
  xe-4820-bd31fb142d057e5995cfeaad45b36e051ccb7ccb: bd31fb142d057e5995cfeaad45b36e051ccb7ccb
  xe-pw-163872v2: 163872v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/index.html

--===============6439827768393136321==
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
<tr><td><b>Series:</b></td><td>drm/i915: More uncore nukage from display code (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163872/">https://patchwork.freedesktop.org/series/163872/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4820-bd31fb142d057e5995cfeaad45b36e051ccb7ccb_FULL -&gt; xe-pw-163872v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163872v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-bmg-5/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +441 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@xe_eudebug_online@pagefault-one-of-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@xe_exec_balancer@once-parallel-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-4k-range-device-host:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4820-bd31fb142d057e5995cfeaad45b36e051ccb7ccb/shard-lnl-8/igt@xe_exec_system_allocator@eu-fault-4k-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-5/igt@xe_exec_system_allocator@eu-fault-4k-range-device-host.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7592">Intel XE#7592</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4820-bd31fb142d057e5995cfeaad45b36e051ccb7ccb/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163872v2/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4820-bd31fb142d057e5995cfeaad45b36e051ccb7ccb -&gt; xe-pw-163872v2</li>
</ul>
<p>IGT_8835: 8835<br />
  xe-4820-bd31fb142d057e5995cfeaad45b36e051ccb7ccb: bd31fb142d057e5995cfeaad45b36e051ccb7ccb<br />
  xe-pw-163872v2: 163872v2</p>

</body>
</html>

--===============6439827768393136321==--
