Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53934C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 05:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F300E10E2F3;
	Wed,  1 Jul 2026 05:28:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F7810E2ED;
 Wed,  1 Jul 2026 05:28:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2413450692524631573=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/guc=5Fads=3A_allocat?=
 =?utf-8?q?e_UM_queues_in_a_separate_UC_BO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 05:28:42 -0000
Message-ID: <178288372274.135317.10206824394154711959@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701041459.2151262-1-jia.yao@intel.com>
In-Reply-To: <20260701041459.2151262-1-jia.yao@intel.com>
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

--===============2413450692524631573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc_ads: allocate UM queues in a separate UC BO
URL   : https://patchwork.freedesktop.org/series/169535/
State : failure

== Summary ==

CI Bug Log - changes from xe-5316-7100870965845da8c31005c07fd1b390bbe96b20_BAT -> xe-pw-169535v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169535v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169535v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-2 bat-bmg-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169535v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2] +36 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5316-7100870965845da8c31005c07fd1b390bbe96b20/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - bat-bmg-1:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5316-7100870965845da8c31005c07fd1b390bbe96b20/bat-bmg-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/bat-bmg-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - bat-bmg-3:          [PASS][5] -> [FAIL][6] +20 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5316-7100870965845da8c31005c07fd1b390bbe96b20/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-169535v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:
    - bat-bmg-1:          [PASS][7] -> [TIMEOUT][8] ([Intel XE#8356])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5316-7100870965845da8c31005c07fd1b390bbe96b20/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-1:          [PASS][9] -> [FAIL][10] ([Intel XE#8353]) +8 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5316-7100870965845da8c31005c07fd1b390bbe96b20/bat-bmg-1/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/bat-bmg-1/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  
  [Intel XE#8353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8353
  [Intel XE#8356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8356


Build changes
-------------

  * Linux: xe-5316-7100870965845da8c31005c07fd1b390bbe96b20 -> xe-pw-169535v1

  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5316-7100870965845da8c31005c07fd1b390bbe96b20: 7100870965845da8c31005c07fd1b390bbe96b20
  xe-pw-169535v1: 169535v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/index.html

--===============2413450692524631573==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc_ads: allocate UM queues in a separate UC BO</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169535/">https://patchwork.freedesktop.org/series/169535/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5316-7100870965845da8c31005c07fd1b390bbe96b20_BAT -&gt; xe-pw-169535v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169535v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-169535v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-2 bat-bmg-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-169535v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5316-7100870965845da8c31005c07fd1b390bbe96b20/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5316-7100870965845da8c31005c07fd1b390bbe96b20/bat-bmg-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/bat-bmg-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5316-7100870965845da8c31005c07fd1b390bbe96b20/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169535v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5316-7100870965845da8c31005c07fd1b390bbe96b20/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8356">Intel XE#8356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5316-7100870965845da8c31005c07fd1b390bbe96b20/bat-bmg-1/igt@xe_exec_system_allocator@many-execqueues-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v1/bat-bmg-1/igt@xe_exec_system_allocator@many-execqueues-malloc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8353">Intel XE#8353</a>) +8 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5316-7100870965845da8c31005c07fd1b390bbe96b20 -&gt; xe-pw-169535v1</li>
</ul>
<p>IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5316-7100870965845da8c31005c07fd1b390bbe96b20: 7100870965845da8c31005c07fd1b390bbe96b20<br />
  xe-pw-169535v1: 169535v1</p>

</body>
</html>

--===============2413450692524631573==--
