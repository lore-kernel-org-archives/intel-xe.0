Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0906ECD98F2
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 14:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C080F10EB9B;
	Tue, 23 Jun 2026 14:14:30 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F8B10EB9C;
 Tue, 23 Jun 2026 14:14:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7310507631462449181=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Introduce_error_threshold_?=
 =?utf-8?q?to_drm=5Fras_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jun 2026 14:14:29 -0000
Message-ID: <178222406942.106260.568130696709079154@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623101043.255897-1-raag.jadav@intel.com>
In-Reply-To: <20260623101043.255897-1-raag.jadav@intel.com>
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

--===============7310507631462449181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce error threshold to drm_ras (rev4)
URL   : https://patchwork.freedesktop.org/series/165091/
State : success

== Summary ==

CI Bug Log - changes from xe-5288-60326b17f877e12846167bf8ef83680b9875218a_FULL -> xe-pw-165091v4_FULL
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

  New tests have been introduced between xe-5288-60326b17f877e12846167bf8ef83680b9875218a_FULL and xe-pw-165091v4_FULL:

### New IGT tests (29) ###

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.49] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.13] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.15] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.68] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.70] s

  * igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.15] s

  * igt@kms_plane_lowres@tiling-none@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.06] s

  * igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.08] s

  * igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.08] s

  * igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.08] s

  * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.14] s

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.04] s

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.10] s

  

Known issues
------------

  Here are the changes found in xe-pw-165091v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3321]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#301] / [Intel XE#3149])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#301])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#2029] / [Intel XE#7395])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@xe_eudebug@basic-close:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7636])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-8/igt@xe_eudebug@basic-close.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2322] / [Intel XE#7372])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][13] -> [ABORT][14] ([Intel XE#8007])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][15] ([Intel XE#7571]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [INCOMPLETE][17] ([Intel XE#4760] / [Intel XE#8155]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][19] ([Intel XE#301]) -> [FAIL][20] ([Intel XE#301] / [Intel XE#3149])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][21] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][22] ([Intel XE#3544])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][23] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][24] ([Intel XE#2426] / [Intel XE#5848])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155


Build changes
-------------

  * Linux: xe-5288-60326b17f877e12846167bf8ef83680b9875218a -> xe-pw-165091v4

  IGT_8979: 8979
  xe-5288-60326b17f877e12846167bf8ef83680b9875218a: 60326b17f877e12846167bf8ef83680b9875218a
  xe-pw-165091v4: 165091v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/index.html

--===============7310507631462449181==
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
<tr><td><b>Series:</b></td><td>Introduce error threshold to drm_ras (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165091/">https://patchwork.freedesktop.org/series/165091/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5288-60326b17f877e12846167bf8ef83680b9875218a_FULL -&gt; xe-pw-165091v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5288-60326b17f877e12846167bf8ef83680b9875218a_FULL and xe-pw-165091v4_FULL:</p>
<h3>New IGT tests (29)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165091v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-8/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5288-60326b17f877e12846167bf8ef83680b9875218a/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165091v4/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5288-60326b17f877e12846167bf8ef83680b9875218a -&gt; xe-pw-165091v4</li>
</ul>
<p>IGT_8979: 8979<br />
  xe-5288-60326b17f877e12846167bf8ef83680b9875218a: 60326b17f877e12846167bf8ef83680b9875218a<br />
  xe-pw-165091v4: 165091v4</p>

</body>
</html>

--===============7310507631462449181==--
