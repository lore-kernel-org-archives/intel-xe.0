Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD20C5DF71
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 08:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E731138E8;
	Tue,  2 Jun 2026 08:13:51 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B891138EA;
 Tue,  2 Jun 2026 08:13:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7723182428299195841=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/forcewake=3A_add_de?=
 =?utf-8?q?layed-release_optimization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Jun 2026 08:13:50 -0000
Message-ID: <178038803013.34290.10646800877875320030@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601213804.707256-1-zongyao.bai@intel.com>
In-Reply-To: <20260601213804.707256-1-zongyao.bai@intel.com>
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

--===============7723182428299195841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/forcewake: add delayed-release optimization
URL   : https://patchwork.freedesktop.org/series/167697/
State : success

== Summary ==

CI Bug Log - changes from xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a_FULL -> xe-pw-167697v1_FULL
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

  Here are the changes found in xe-pw-167697v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#301] / [Intel XE#3149])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#7915]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#7850])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-10/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][7] -> [ABORT][8] ([Intel XE#8007])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-10/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][9] ([Intel XE#301]) -> [PASS][10] +2 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][11] ([Intel XE#7915]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-7/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-2/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][13] ([Intel XE#6321]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@long-spin-many-preempt-media:
    - shard-bmg:          [FAIL][15] ([Intel XE#7956]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-4/igt@xe_exec_reset@long-spin-many-preempt-media.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-media.html

  * igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][17] ([Intel XE#7850]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-9/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-4/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][19] ([Intel XE#301]) -> [FAIL][20] ([Intel XE#301] / [Intel XE#3149])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][21] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916]) -> [SKIP][22] ([Intel XE#3544] / [Intel XE#7916])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][23] ([Intel XE#7915]) -> [SKIP][24] ([Intel XE#7916]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][25] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][26] ([Intel XE#2426] / [Intel XE#5848])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a -> xe-pw-167697v1

  IGT_8944: 8944
  xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a: 4b57b105843615beabfbc703c5b38445edac8a1a
  xe-pw-167697v1: 167697v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/index.html

--===============7723182428299195841==
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
<tr><td><b>Series:</b></td><td>drm/xe/forcewake: add delayed-release optimization</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167697/">https://patchwork.freedesktop.org/series/167697/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a_FULL -&gt; xe-pw-167697v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167697v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-10/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-10/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-7/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-2/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-media:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-4/igt@xe_exec_reset@long-spin-many-preempt-media.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-media.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-9/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-4/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a -&gt; xe-pw-167697v1</li>
</ul>
<p>IGT_8944: 8944<br />
  xe-5176-4b57b105843615beabfbc703c5b38445edac8a1a: 4b57b105843615beabfbc703c5b38445edac8a1a<br />
  xe-pw-167697v1: 167697v1</p>

</body>
</html>

--===============7723182428299195841==--
