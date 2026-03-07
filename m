Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0F5FC9ED3
	for <intel-xe@archiver.kernel.org>; Sat,  7 Mar 2026 06:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3B510E416;
	Sat,  7 Mar 2026 06:36:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C4B10E34D;
 Sat,  7 Mar 2026 06:36:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3706453388191767976=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Enable_Wa=5F1402?=
 =?utf-8?q?5515070=2C_Enable_indirect_ring_state_for_XE2+_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Mar 2026 06:36:04 -0000
Message-ID: <177286536471.329852.13598547182401395824@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304003431.758201-3-julia.filipchuk@intel.com>
In-Reply-To: <20260304003431.758201-3-julia.filipchuk@intel.com>
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

--===============3706453388191767976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enable Wa_14025515070, Enable indirect ring state for XE2+ (rev9)
URL   : https://patchwork.freedesktop.org/series/160812/
State : failure

== Summary ==

CI Bug Log - changes from xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3_FULL -> xe-pw-160812v9_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160812v9_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160812v9_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160812v9_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-6/igt@xe_module_load@many-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-5/igt@xe_module_load@many-reload.html

  
Known issues
------------

  Here are the changes found in xe-pw-160812v9_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] ([Intel XE#7084])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][10] -> [INCOMPLETE][11] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][12] ([Intel XE#2049] / [Intel XE#2597])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#1503])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#2142]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2322] / [Intel XE#7372])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-suspend@d-dp2:
    - shard-bmg:          [INCOMPLETE][18] ([Intel XE#2049] / [Intel XE#2597] / [Intel XE#5545]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-2/igt@kms_flip@flip-vs-suspend@d-dp2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-9/igt@kms_flip@flip-vs-suspend@d-dp2.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][20] ([Intel XE#7340]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][22] ([Intel XE#6361]) -> [PASS][23] +3 other tests pass
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-8/igt@kms_setmode@basic.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-1/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][24] ([Intel XE#6361]) -> [PASS][25] +2 other tests pass
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][26] ([Intel XE#6321]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][28] ([Intel XE#2049] / [Intel XE#2597] / [Intel XE#5545]) -> [INCOMPLETE][29] ([Intel XE#2049] / [Intel XE#2597])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][30] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][31] ([Intel XE#2426] / [Intel XE#5848])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437


Build changes
-------------

  * Linux: xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3 -> xe-pw-160812v9

  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3: 6707287bc6e4620c3bde4f316248cc8e7a4a95d3
  xe-pw-160812v9: 160812v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/index.html

--===============3706453388191767976==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enable Wa_14025515070, Enable indirect ring state for XE2+ (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160812/">https://patchwork.freedesktop.org/series/160812/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3_FULL -&gt; xe-pw-160812v9_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160812v9_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160812v9_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160812v9_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-6/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-5/igt@xe_module_load@many-reload.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160812v9_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-2/igt@kms_flip@flip-vs-suspend@d-dp2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-9/igt@kms_flip@flip-vs-suspend@d-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-1/igt@kms_setmode@basic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v9/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3 -&gt; xe-pw-160812v9</li>
</ul>
<p>IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3: 6707287bc6e4620c3bde4f316248cc8e7a4a95d3<br />
  xe-pw-160812v9: 160812v9</p>

</body>
</html>

--===============3706453388191767976==--
