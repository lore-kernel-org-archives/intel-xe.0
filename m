Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74012EDB7D0
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 22:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2440A10E4E6;
	Tue,  7 Apr 2026 22:15:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D65A10E4D9;
 Tue,  7 Apr 2026 22:15:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3442494197930373738=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/xe=5Fsysctrl=3A_Fix?=
 =?utf-8?q?_sparse_endian_warnings_in_mailbox_header_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Apr 2026 22:15:17 -0000
Message-ID: <177560011756.438154.9082122816911106090@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260407180339.794310-2-anoop.c.vijay@intel.com>
In-Reply-To: <20260407180339.794310-2-anoop.c.vijay@intel.com>
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

--===============3442494197930373738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_sysctrl: Fix sparse endian warnings in mailbox header macros
URL   : https://patchwork.freedesktop.org/series/164466/
State : success

== Summary ==

CI Bug Log - changes from xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b_FULL -> xe-pw-164466v1_FULL
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

  Here are the changes found in xe-pw-164466v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#7578]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#5354])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-9/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@forked-move:
    - shard-bmg:          [PASS][5] -> [ABORT][6] ([Intel XE#5545]) +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-10/igt@kms_cursor_legacy@forked-move.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-2/igt@kms_cursor_legacy@forked-move.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2322] / [Intel XE#7372])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_multi_queue@max-queues-dyn-priority:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][8] ([Intel XE#2594])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-dyn-priority.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#5625])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7138])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][12] ([Intel XE#5354]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][14] ([Intel XE#301]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [FAIL][16] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-8/igt@kms_vrr@flip-dpms.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-lnl-6/igt@kms_vrr@flip-dpms.html

  * igt@xe_pm_residency@cpg-gt-toggle:
    - shard-bmg:          [INCOMPLETE][18] ([Intel XE#2594]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-10/igt@xe_pm_residency@cpg-gt-toggle.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-9/igt@xe_pm_residency@cpg-gt-toggle.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][20] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][21] ([Intel XE#3544])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][22] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][23] ([Intel XE#1729] / [Intel XE#7424])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][24] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][25] ([Intel XE#2426] / [Intel XE#5848])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578


Build changes
-------------

  * Linux: xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b -> xe-pw-164466v1

  IGT_8850: 8850
  xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b: 9e217a8df7b2f298a2fd850e29f970b7360dc77b
  xe-pw-164466v1: 164466v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/index.html

--===============3442494197930373738==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_sysctrl: Fix sparse endian warnings in mailbox header macros</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164466/">https://patchwork.freedesktop.org/series/164466/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b_FULL -&gt; xe-pw-164466v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164466v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-9/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-10/igt@kms_cursor_legacy@forked-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-2/igt@kms_cursor_legacy@forked-move.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-dyn-priority.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-8/igt@kms_vrr@flip-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-lnl-6/igt@kms_vrr@flip-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-gt-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-10/igt@xe_pm_residency@cpg-gt-toggle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-9/igt@xe_pm_residency@cpg-gt-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164466v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b -&gt; xe-pw-164466v1</li>
</ul>
<p>IGT_8850: 8850<br />
  xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b: 9e217a8df7b2f298a2fd850e29f970b7360dc77b<br />
  xe-pw-164466v1: 164466v1</p>

</body>
</html>

--===============3442494197930373738==--
