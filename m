Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5BDC982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 17:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79D910E734;
	Fri, 18 Sep 2026 17:26:33 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDE910E734;
 Fri, 18 Sep 2026 17:26:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3871464354862514383=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915=3A_use_string_choi?=
 =?utf-8?q?ce_helpers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lalit Shankar Chowdhury" <lalitshankarch@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 17:26:32 -0000
Message-ID: <178975239211.181279.13509622055784459448@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918042325.17700-1-lalitshankarch@gmail.com>
In-Reply-To: <20260918042325.17700-1-lalitshankarch@gmail.com>
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

--===============3871464354862514383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: use string choice helpers (rev2)
URL   : https://patchwork.freedesktop.org/series/174521/
State : failure

== Summary ==

CI Bug Log - changes from xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392_BAT -> xe-pw-174521v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174521v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174521v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174521v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-vm:         [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - bat-bmg-3:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-174521v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_system_allocator@fault:
    - bat-bmg-1:          [DMESG-WARN][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-1/igt@xe_exec_system_allocator@fault.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-1/igt@xe_exec_system_allocator@fault.html

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [DMESG-WARN][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - bat-bmg-3:          [DMESG-WARN][11] -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  


Build changes
-------------

  * IGT: IGT_9101 -> IGT_9102
  * Linux: xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392 -> xe-pw-174521v2

  IGT_9101: 16e3ae670fa6c3ee97f113c688a172bb0f6034e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9102: d7e81cbe807db27613dd3bc96f4e46262e75569d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392: 6ef00cbe08bb0ce4a59e9ace88b107d424431392
  xe-pw-174521v2: 174521v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/index.html

--===============3871464354862514383==
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
<tr><td><b>Series:</b></td><td>drm/i915: use string choice helpers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174521/">https://patchwork.freedesktop.org/series/174521/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392_BAT -&gt; xe-pw-174521v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174521v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-174521v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-174521v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174521v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@fault:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-1/igt@xe_exec_system_allocator@fault.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-1/igt@xe_exec_system_allocator@fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174521v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9101 -&gt; IGT_9102</li>
<li>Linux: xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392 -&gt; xe-pw-174521v2</li>
</ul>
<p>IGT_9101: 16e3ae670fa6c3ee97f113c688a172bb0f6034e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9102: d7e81cbe807db27613dd3bc96f4e46262e75569d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392: 6ef00cbe08bb0ce4a59e9ace88b107d424431392<br />
  xe-pw-174521v2: 174521v2</p>

</body>
</html>

--===============3871464354862514383==--
