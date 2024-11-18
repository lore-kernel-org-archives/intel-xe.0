Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05581D49221
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 14:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA41010E4E1;
	Mon, 18 Nov 2024 14:04:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB0310E4E1;
 Mon, 18 Nov 2024 14:04:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0597123081061283320=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_support_for_EU_stall_samplin?=
 =?utf-8?q?g?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 14:04:00 -0000
Message-ID: <173193864078.1238019.5568020892227817243@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731919693.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1731919693.git.harish.chegondi@intel.com>
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

--===============0597123081061283320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for EU stall sampling
URL   : https://patchwork.freedesktop.org/series/141483/
State : success

== Summary ==

CI Bug Log - changes from xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f_BAT -> xe-pw-141483v1_BAT
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

  Here are the changes found in xe-pw-141483v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#1033])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#358])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][5] -> [SKIP][6] ([Intel XE#1192]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][7] ([Intel XE#886]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [DMESG-WARN][9] ([Intel XE#3371]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][11] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][12] ([Intel XE#1192])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][13] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][14] ([Intel XE#977])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-vf:        [SKIP][15] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][16] ([Intel XE#977])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][17] ([Intel XE#2839] / [Intel XE#3443] / [Intel XE#977]) -> [SKIP][18] ([Intel XE#3443] / [Intel XE#977])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][20] ([Intel XE#977])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][21] ([Intel XE#2237] / [Intel XE#2245]) -> [SKIP][22] ([Intel XE#2245])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][23] ([Intel XE#2237] / [Intel XE#2245]) -> [SKIP][24] ([Intel XE#2245])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][25] ([Intel XE#2237] / [Intel XE#977]) -> [SKIP][26] ([Intel XE#977])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f -> xe-pw-141483v1

  IGT_8114: 8114
  xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f: 57639ceec0f66f06f4a8a8ac3b9551b7b493c33f
  xe-pw-141483v1: 141483v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/index.html

--===============0597123081061283320==
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
<tr><td><b>Series:</b></td><td>Add support for EU stall sampling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141483/">https://patchwork.freedesktop.org/series/141483/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f_BAT -&gt; xe-pw-141483v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141483v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141483v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f -&gt; xe-pw-141483v1</li>
</ul>
<p>IGT_8114: 8114<br />
  xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f: 57639ceec0f66f06f4a8a8ac3b9551b7b493c33f<br />
  xe-pw-141483v1: 141483v1</p>

</body>
</html>

--===============0597123081061283320==--
