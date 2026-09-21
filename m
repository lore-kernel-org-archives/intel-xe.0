Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BECC982E1
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 10:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5CF891C0;
	Mon, 21 Sep 2026 10:37:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532D9891C0;
 Mon, 21 Sep 2026 10:37:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8206303104793327898=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/cx0=5Fphy=3A_Fix_A?=
 =?utf-8?q?RL-S_host_bridge_detection_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 10:37:23 -0000
Message-ID: <178998704333.186928.7331250814104162669@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260921090226.946472-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260921090226.946472-1-dnyaneshwar.bhadane@intel.com>
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

--===============8206303104793327898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cx0_phy: Fix ARL-S host bridge detection (rev2)
URL   : https://patchwork.freedesktop.org/series/174302/
State : failure

== Summary ==

CI Bug Log - changes from xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf_BAT -> xe-pw-174302v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174302v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174302v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174302v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  
#### Warnings ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-bmg-2:          [DMESG-WARN][3] ([Intel XE#9331]) -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-vm:         [DMESG-WARN][5] ([Intel XE#9331]) -> [DMESG-WARN][6] +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [DMESG-WARN][7] ([Intel XE#9331]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - bat-bmg-3:          [DMESG-WARN][9] ([Intel XE#9331]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-174302v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_system_allocator@fault:
    - bat-bmg-1:          [DMESG-WARN][11] ([Intel XE#9331]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-1/igt@xe_exec_system_allocator@fault.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-1/igt@xe_exec_system_allocator@fault.html

  
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331


Build changes
-------------

  * Linux: xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf -> xe-pw-174302v2

  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf
  xe-pw-174302v2: 174302v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/index.html

--===============8206303104793327898==
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
<tr><td><b>Series:</b></td><td>drm/i915/cx0_phy: Fix ARL-S host bridge detection (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174302/">https://patchwork.freedesktop.org/series/174302/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf_BAT -&gt; xe-pw-174302v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174302v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-174302v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-174302v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-rebind-prefetch:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174302v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_system_allocator@fault:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/bat-bmg-1/igt@xe_exec_system_allocator@fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v2/bat-bmg-1/igt@xe_exec_system_allocator@fault.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf -&gt; xe-pw-174302v2</li>
</ul>
<p>IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf<br />
  xe-pw-174302v2: 174302v2</p>

</body>
</html>

--===============8206303104793327898==--
