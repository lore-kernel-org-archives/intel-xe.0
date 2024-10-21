Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0805CD0E6F4
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 11:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF27D10E49E;
	Mon, 21 Oct 2024 11:36:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A547710E49E;
 Mon, 21 Oct 2024 11:36:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1214872779007310441=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_=28CI=29_drm/xe=3A_Fix_initial_f?=
 =?utf-8?q?ramebuffer_handover=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 11:36:15 -0000
Message-ID: <172951057567.1304624.15135114184864718774@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
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

--===============1214872779007310441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: (CI) drm/xe: Fix initial framebuffer handover. (rev3)
URL   : https://patchwork.freedesktop.org/series/140183/
State : success

== Summary ==

CI Bug Log - changes from xe-2103-784111a40e40a37100e61736dd137c72cedbdb39_BAT -> xe-pw-140183v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-140183v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-2:          [PASS][1] -> [FAIL][2] ([Intel XE#2754])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#2687])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][5] -> [SKIP][6] ([Intel XE#1192]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@load:
    - bat-lnl-1:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#1727])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-lnl-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-lnl-1/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][9] ([Intel XE#977]) -> [SKIP][10] ([Intel XE#2839] / [Intel XE#977])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-vf:        [SKIP][11] ([Intel XE#977]) -> [SKIP][12] ([Intel XE#2839] / [Intel XE#977])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][13] ([Intel XE#977]) -> [SKIP][14] ([Intel XE#2839] / [Intel XE#977])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#977]) -> [SKIP][16] ([Intel XE#2839] / [Intel XE#977])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-1:          [SKIP][17] ([Intel XE#2245]) -> [SKIP][18] ([Intel XE#2237] / [Intel XE#2245])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][19] ([Intel XE#977]) -> [SKIP][20] ([Intel XE#2237] / [Intel XE#977])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-lnl-2/igt@xe_pat@pat-index-xelp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-2103-784111a40e40a37100e61736dd137c72cedbdb39 -> xe-pw-140183v3

  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2103-784111a40e40a37100e61736dd137c72cedbdb39: 784111a40e40a37100e61736dd137c72cedbdb39
  xe-pw-140183v3: 140183v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/index.html

--===============1214872779007310441==
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
<tr><td><b>Series:</b></td><td>(CI) drm/xe: Fix initial framebuffer handover. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140183/">https://patchwork.freedesktop.org/series/140183/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2103-784111a40e40a37100e61736dd137c72cedbdb39_BAT -&gt; xe-pw-140183v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140183v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2103-784111a40e40a37100e61736dd137c72cedbdb39/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v3/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2103-784111a40e40a37100e61736dd137c72cedbdb39 -&gt; xe-pw-140183v3</li>
</ul>
<p>IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2103-784111a40e40a37100e61736dd137c72cedbdb39: 784111a40e40a37100e61736dd137c72cedbdb39<br />
  xe-pw-140183v3: 140183v3</p>

</body>
</html>

--===============1214872779007310441==--
