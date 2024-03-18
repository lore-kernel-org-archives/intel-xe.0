Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65014C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 21:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234FF10E62B;
	Mon, 18 Mar 2024 21:52:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1F810E62B;
 Mon, 18 Mar 2024 21:52:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3562675754845140384=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe=3A_Fix_potential_integer_overflow_in_page_size_calculation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Mar 2024 21:52:49 -0000
Message-ID: <171079876936.900325.8688835171338925017@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318135000.13032-1-nirmoy.das@intel.com>
In-Reply-To: <20240318135000.13032-1-nirmoy.das@intel.com>
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

--===============3562675754845140384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Fix potential integer overflow in page size calculation
URL   : https://patchwork.freedesktop.org/series/131270/
State : failure

== Summary ==

CI Bug Log - changes from xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6_BAT -> xe-pw-131270v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131270v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131270v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131270v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-WARN][4] +23 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-131270v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-atsm-2:         [PASS][7] -> [INCOMPLETE][8] ([Intel XE#804])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [PASS][9] -> [INCOMPLETE][10] ([Intel XE#804])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-adlp-7:         [PASS][11] -> [INCOMPLETE][12] ([Intel XE#925])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [PASS][13] -> [INCOMPLETE][14] ([Intel XE#1169]) +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-dg2-oem2:       [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1044])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo:
    - bat-dg2-oem2:       [PASS][17] -> [SKIP][18] ([Intel XE#1192]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804
  [Intel XE#925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/925


Build changes
-------------

  * Linux: xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6 -> xe-pw-131270v1

  IGT_7769: 7769
  xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6: ce8cc731d53f9197a853b0d00386d7835f2b80e6
  xe-pw-131270v1: 131270v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/index.html

--===============3562675754845140384==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Fix potential integer overflow in page size calculation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131270/">https://patchwork.freedesktop.org/series/131270/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6_BAT -&gt; xe-pw-131270v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131270v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131270v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131270v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">DMESG-WARN</a> +23 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131270v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/925">Intel XE#925</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131270v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6 -&gt; xe-pw-131270v1</li>
</ul>
<p>IGT_7769: 7769<br />
  xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6: ce8cc731d53f9197a853b0d00386d7835f2b80e6<br />
  xe-pw-131270v1: 131270v1</p>

</body>
</html>

--===============3562675754845140384==--
