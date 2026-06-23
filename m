Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D5BCDB471
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 20:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B2310EC8D;
	Tue, 23 Jun 2026 20:12:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E6310EC8D;
 Tue, 23 Jun 2026 20:12:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8008167380842186963=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915=3A_Clean_up_GPIO_?=
 =?utf-8?q?pin_stuff_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jun 2026 20:12:57 -0000
Message-ID: <178224557735.106801.9500031216762642301@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
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

--===============8008167380842186963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Clean up GPIO pin stuff (rev2)
URL   : https://patchwork.freedesktop.org/series/169023/
State : failure

== Summary ==

CI Bug Log - changes from xe-5288-60326b17f877e12846167bf8ef83680b9875218a_FULL -> xe-pw-169023v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169023v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169023v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169023v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@asahi/asahi_get_time@get-time-compare:
    - shard-lnl:          NOTRUN -> [SKIP][1] +8 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-lnl-5/igt@asahi/asahi_get_time@get-time-compare.html

  * igt@asahi/asahi_get_time@get-time-flags-1:
    - shard-bmg:          NOTRUN -> [SKIP][2] +8 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-9/igt@asahi/asahi_get_time@get-time-flags-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-169023v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([i915#4767])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#301])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][7] -> [SKIP][8] ([Intel XE#8361])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#6361]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-4/igt@kms_setmode@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-6/igt@kms_setmode@basic.html

  * igt@xe_eudebug@basic-close:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7636])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-2/igt@xe_eudebug@basic-close.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2322] / [Intel XE#7372])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#8369])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-4/igt@xe_exec_reset@multi-queue-cat-error.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][14] ([Intel XE#7571]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][16] ([Intel XE#301]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [INCOMPLETE][18] ([Intel XE#4760] / [Intel XE#8155]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][20] ([Intel XE#1503]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [FAIL][22] ([Intel XE#7992]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][24] ([Intel XE#6569]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][26] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][27] ([Intel XE#3544])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][28] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][29] ([Intel XE#2426] / [Intel XE#5848])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][30] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][31] ([Intel XE#2426] / [Intel XE#5848])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767


Build changes
-------------

  * IGT: IGT_8979 -> IGT_8980
  * Linux: xe-5288-60326b17f877e12846167bf8ef83680b9875218a -> xe-pw-169023v2

  IGT_8979: 8979
  IGT_8980: 65d820119e86b017bf801c8f2bb500e557b29d1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5288-60326b17f877e12846167bf8ef83680b9875218a: 60326b17f877e12846167bf8ef83680b9875218a
  xe-pw-169023v2: 169023v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/index.html

--===============8008167380842186963==
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
<tr><td><b>Series:</b></td><td>drm/i915: Clean up GPIO pin stuff (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169023/">https://patchwork.freedesktop.org/series/169023/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5288-60326b17f877e12846167bf8ef83680b9875218a_FULL -&gt; xe-pw-169023v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169023v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-169023v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-169023v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@asahi/asahi_get_time@get-time-compare:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-lnl-5/igt@asahi/asahi_get_time@get-time-compare.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@asahi/asahi_get_time@get-time-flags-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-9/igt@asahi/asahi_get_time@get-time-flags-1.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169023v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361">Intel XE#8361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-2/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-4/igt@xe_exec_reset@multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169023v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8979 -&gt; IGT_8980</li>
<li>Linux: xe-5288-60326b17f877e12846167bf8ef83680b9875218a -&gt; xe-pw-169023v2</li>
</ul>
<p>IGT_8979: 8979<br />
  IGT_8980: 65d820119e86b017bf801c8f2bb500e557b29d1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5288-60326b17f877e12846167bf8ef83680b9875218a: 60326b17f877e12846167bf8ef83680b9875218a<br />
  xe-pw-169023v2: 169023v2</p>

</body>
</html>

--===============8008167380842186963==--
