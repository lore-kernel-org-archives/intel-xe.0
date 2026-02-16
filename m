Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488A0EF48C9
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 08:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C5510E224;
	Mon, 16 Feb 2026 08:59:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4011C10E201;
 Mon, 16 Feb 2026 08:59:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8979835201278914742=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/dp=5Fmst=3A_Allow?=
 =?utf-8?q?_DSC_passthrough_modes_during_validation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Feb 2026 08:59:10 -0000
Message-ID: <177123235023.255575.8398805718299447974@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260216070421.714884-1-imre.deak@intel.com>
In-Reply-To: <20260216070421.714884-1-imre.deak@intel.com>
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

--===============8979835201278914742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_mst: Allow DSC passthrough modes during validation
URL   : https://patchwork.freedesktop.org/series/161635/
State : failure

== Summary ==

CI Bug Log - changes from xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc_FULL -> xe-pw-161635v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161635v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161635v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161635v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2:
    - shard-bmg:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2.html

  
New tests
---------

  New tests have been introduced between xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc_FULL and xe-pw-161635v1_FULL:

### New IGT tests (8) ###

  * igt@core_setmaster@master-drop-set-root:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@core_setmaster@master-drop-set-shared-fd:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@core_setmaster@master-drop-set-user:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_cursor_edge_walk@64x64-left-edge@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.23] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.42] s

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 13.07] s

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:
    - Statuses : 1 pass(s)
    - Exec time: [3.72] s

  

Known issues
------------

  Here are the changes found in xe-pw-161635v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_cursor_edge_walk@256x256-left-edge:
    - shard-bmg:          [PASS][5] -> [ABORT][6] ([Intel XE#1727])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-left-edge.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-left-edge.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2:
    - shard-bmg:          [PASS][7] -> [INCOMPLETE][8] ([Intel XE#1727])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#5299])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#301]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][13] -> [INCOMPLETE][14] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#2142]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][17] -> [INCOMPLETE][18] ([Intel XE#6321])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Possible fixes ####

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][19] ([Intel XE#4459]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@fault-threads-benchmark:
    - shard-bmg:          [FAIL][21] -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-5/igt@xe_exec_system_allocator@fault-threads-benchmark.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-5/igt@xe_exec_system_allocator@fault-threads-benchmark.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-lnl:          [FAIL][23] -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-lnl-6/igt@xe_oa@non-zero-reason-all.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-lnl-5/igt@xe_oa@non-zero-reason-all.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][25] ([Intel XE#3544]) -> [SKIP][26] ([Intel XE#3374] / [Intel XE#3544])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][27] ([Intel XE#5466] / [Intel XE#6652]) -> [ABORT][28] ([Intel XE#5466])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-10/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652


Build changes
-------------

  * Linux: xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc -> xe-pw-161635v1

  IGT_8753: 8753
  xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc: eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc
  xe-pw-161635v1: 161635v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/index.html

--===============8979835201278914742==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_mst: Allow DSC passthrough modes during validation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161635/">https://patchwork.freedesktop.org/series/161635/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc_FULL -&gt; xe-pw-161635v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161635v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161635v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161635v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc_FULL and xe-pw-161635v1_FULL:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 13.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.72] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161635v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-left-edge.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-threads-benchmark:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-5/igt@xe_exec_system_allocator@fault-threads-benchmark.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-5/igt@xe_exec_system_allocator@fault-threads-benchmark.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-lnl-6/igt@xe_oa@non-zero-reason-all.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-lnl-5/igt@xe_oa@non-zero-reason-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc/shard-bmg-10/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161635v1/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc -&gt; xe-pw-161635v1</li>
</ul>
<p>IGT_8753: 8753<br />
  xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc: eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc<br />
  xe-pw-161635v1: 161635v1</p>

</body>
</html>

--===============8979835201278914742==--
