Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27000D68BDA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 22:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3FE10E8F9;
	Fri, 15 Nov 2024 22:24:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A86310E8F9;
 Fri, 15 Nov 2024 22:24:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0050586697671452938=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/vf=3A_Print_assumed_value?=
 =?utf-8?q?s_of_the_MOCS_entries_if_VF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Nov 2024 22:24:28 -0000
Message-ID: <173170946851.380828.3888859740019181268@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241115210025.2343-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241115210025.2343-1-michal.wajdeczko@intel.com>
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

--===============0050586697671452938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Print assumed values of the MOCS entries if VF
URL   : https://patchwork.freedesktop.org/series/141427/
State : failure

== Summary ==

CI Bug Log - changes from xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf_BAT -> xe-pw-141427v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141427v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141427v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141427v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-lnl-1:          [PASS][1] -> [DMESG-FAIL][2] +33 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-lnl-2:          [PASS][3] -> [DMESG-FAIL][4] +33 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-basic:
    - bat-lnl-1:          [PASS][5] -> [DMESG-WARN][6] +3 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-1/igt@xe_exec_threads@threads-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-1/igt@xe_exec_threads@threads-basic.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-lnl-2:          [PASS][7] -> [DMESG-WARN][8] +3 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-141427v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][9] ([Intel XE#261] / [Intel XE#3443] / [Intel XE#688]) +15 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][10] ([Intel XE#288] / [Intel XE#3443]) +32 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [PASS][11] -> [SKIP][12] ([Intel XE#2229] / [Intel XE#455])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-1:          [PASS][13] -> [SKIP][14] ([Intel XE#1192]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][17] ([Intel XE#2229] / [Intel XE#3443])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo:
    - bat-bmg-1:          [INCOMPLETE][18] ([Intel XE#2874] / [Intel XE#2998]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-bmg-1/igt@xe_live_ktest@xe_bo.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-bmg-1/igt@xe_live_ktest@xe_bo.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         [INCOMPLETE][20] ([Intel XE#2874]) -> [SKIP][21] ([Intel XE#2229] / [Intel XE#3443] / [Intel XE#455])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         [SKIP][22] ([Intel XE#2229] / [Intel XE#3443]) -> [SKIP][23] ([Intel XE#2229] / [Intel XE#3443] / [Intel XE#455]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-adlp-vf:        [SKIP][24] ([Intel XE#2229]) -> [SKIP][25] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#3443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_8111 -> IGT_8114
  * Linux: xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf -> xe-pw-141427v1

  IGT_8111: 67422a7b55b0278cf0d1bfdc0899ee637ed7d588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8114: 8114
  xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf: 36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf
  xe-pw-141427v1: 141427v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/index.html

--===============0050586697671452938==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Print assumed values of the MOCS entries if VF</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141427/">https://patchwork.freedesktop.org/series/141427/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf_BAT -&gt; xe-pw-141427v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141427v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141427v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141427v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">DMESG-FAIL</a> +33 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">DMESG-FAIL</a> +33 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141427v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-bmg-1/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-bmg-1/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141427v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8111 -&gt; IGT_8114</li>
<li>Linux: xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf -&gt; xe-pw-141427v1</li>
</ul>
<p>IGT_8111: 67422a7b55b0278cf0d1bfdc0899ee637ed7d588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8114: 8114<br />
  xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf: 36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf<br />
  xe-pw-141427v1: 141427v1</p>

</body>
</html>

--===============0050586697671452938==--
