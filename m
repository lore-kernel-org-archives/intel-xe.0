Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A1ED0C5F9
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 09:56:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E251B10EA5A;
	Fri, 25 Oct 2024 09:56:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE00510EA5A;
 Fri, 25 Oct 2024 09:56:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8107359095114159328=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Introduce_DRM_device_wedged_even?=
 =?utf-8?q?t_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 09:56:04 -0000
Message-ID: <172985016490.1331517.17131059108757277542@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025084817.144621-1-raag.jadav@intel.com>
In-Reply-To: <20241025084817.144621-1-raag.jadav@intel.com>
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

--===============8107359095114159328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce DRM device wedged event (rev6)
URL   : https://patchwork.freedesktop.org/series/138070/
State : failure

== Summary ==

CI Bug Log - changes from xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107_BAT -> xe-pw-138070v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138070v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138070v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138070v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-bmg-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-bmg-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-138070v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#2496]) +31 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-lnl-2:          [PASS][5] -> [DMESG-WARN][6] ([Intel XE#3230])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-lnl-1:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#3230])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [PASS][9] -> [DMESG-WARN][10] ([Intel XE#3230])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-atsm-2:         [PASS][11] -> [DMESG-WARN][12] ([Intel XE#3230])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-pvc-2:          [PASS][13] -> [DMESG-WARN][14] ([Intel XE#3230])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [PASS][17] -> [SKIP][18] ([Intel XE#1192]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][19] -> [SKIP][20] ([Intel XE#1192]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-pvc-2:          NOTRUN -> [SKIP][21] ([Intel XE#2229]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][22] ([Intel XE#1861]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr:
    - bat-pvc-2:          [DMESG-WARN][24] -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-lnl-1:          [DMESG-WARN][26] ([Intel XE#3230]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
    - bat-lnl-2:          [DMESG-WARN][28] ([Intel XE#3230]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-bmg-2:          [DMESG-WARN][30] ([Intel XE#3230]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [DMESG-WARN][32] ([Intel XE#3230]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
    - bat-atsm-2:         [DMESG-WARN][34] ([Intel XE#3230]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [SKIP][36] ([Intel XE#1192]) -> [PASS][37] +2 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230


Build changes
-------------

  * Linux: xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107 -> xe-pw-138070v6

  IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107: 8fb857e3bba9a5e5fa43d99cf5863608cde9c107
  xe-pw-138070v6: 138070v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/index.html

--===============8107359095114159328==
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
<tr><td><b>Series:</b></td><td>Introduce DRM device wedged event (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138070/">https://patchwork.freedesktop.org/series/138070/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107_BAT -&gt; xe-pw-138070v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138070v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138070v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138070v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-bmg-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-bmg-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138070v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496">Intel XE#2496</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107 -&gt; xe-pw-138070v6</li>
</ul>
<p>IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107: 8fb857e3bba9a5e5fa43d99cf5863608cde9c107<br />
  xe-pw-138070v6: 138070v6</p>

</body>
</html>

--===============8107359095114159328==--
