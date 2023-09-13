Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D67EE3F3F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 00:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC0010E0CB;
	Wed, 13 Sep 2023 00:39:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B80FE10E0CB;
 Wed, 13 Sep 2023 00:39:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B1430AADDC;
 Wed, 13 Sep 2023 00:39:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8739307267332725974=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 13 Sep 2023 00:39:15 -0000
Message-ID: <169456555569.31250.16518124817433621760@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230912235159.2111118-1-matthew.brost@intel.com>
In-Reply-To: <20230912235159.2111118-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Remove_XE?=
 =?utf-8?q?=5FEXEC=5FQUEUE=5FSET=5FPROPERTY=5FCOMPUTE=5FMODE?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============8739307267332725974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
URL   : https://patchwork.freedesktop.org/series/123620/
State : failure

== Summary ==

CI Bug Log - changes from xe-369-da184d0771450c366fa6499d42b49eba733a67f8_BAT -> xe-pw-123620v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123620v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123620v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123620v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [PASS][1] -> [TIMEOUT][2] +3 other tests timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][3] -> [TIMEOUT][4] +3 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
    - bat-dg2-oem2:       [PASS][5] -> [TIMEOUT][6] +4 other tests timeout
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - bat-pvc-2:          [PASS][7] -> [FAIL][8] +14 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] +18 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][11] -> [FAIL][12] +18 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [PASS][15] -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
    - bat-atsm-2:         [PASS][17] -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
#### Warnings ####

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][19] ([Intel XE#482]) -> [FAIL][20] +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][21] -> [FAIL][22] +4 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
    - bat-dg2-oem2:       [PASS][23] -> [FAIL][24] +4 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [PASS][25] -> [FAIL][26] +4 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-123620v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * Linux: xe-369-da184d0771450c366fa6499d42b49eba733a67f8 -> xe-pw-123620v1

  IGT_7482: beccb244183d5839c2464b856cd0b541f105e2ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-369-da184d0771450c366fa6499d42b49eba733a67f8: da184d0771450c366fa6499d42b49eba733a67f8
  xe-pw-123620v1: 123620v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/index.html

--===============8739307267332725974==
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
<tr><td><b>Series:</b></td><td>Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123620/">https://patchwork.freedesktop.org/series/123620/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-369-da184d0771450c366fa6499d42b49eba733a67f8_BAT -&gt; xe-pw-123620v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123620v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123620v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123620v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">TIMEOUT</a> +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">TIMEOUT</a> +3 other tests timeout</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">TIMEOUT</a> +4 other tests timeout</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-small-cm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +4 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123620v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123620v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-369-da184d0771450c366fa6499d42b49eba733a67f8 -&gt; xe-pw-123620v1</li>
</ul>
<p>IGT_7482: beccb244183d5839c2464b856cd0b541f105e2ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-369-da184d0771450c366fa6499d42b49eba733a67f8: da184d0771450c366fa6499d42b49eba733a67f8<br />
  xe-pw-123620v1: 123620v1</p>

</body>
</html>

--===============8739307267332725974==--
