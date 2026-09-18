Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6018DC982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 14:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1C210F3E7;
	Fri, 18 Sep 2026 14:50:27 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C874A10F3F3;
 Fri, 18 Sep 2026 14:50:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4678005702007714175=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/vm=3A_nuke_PTs_only_?=
 =?utf-8?q?after_unlinking_contested_VMAs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 14:50:25 -0000
Message-ID: <178974302581.182123.18435184090413657957@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918131034.598078-2-matthew.auld@intel.com>
In-Reply-To: <20260918131034.598078-2-matthew.auld@intel.com>
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

--===============4678005702007714175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm: nuke PTs only after unlinking contested VMAs
URL   : https://patchwork.freedesktop.org/series/174512/
State : failure

== Summary ==

CI Bug Log - changes from xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05_BAT -> xe-pw-174512v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174512v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174512v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174512v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [PASS][5] -> [DMESG-WARN][6] +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - bat-bmg-3:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-174512v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][9] -> [ABORT][10] ([Intel XE#8007])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [FAIL][11] ([Intel XE#9109]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-ptl-2/igt@xe_waitfence@engine.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-ptl-2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [FAIL][13] ([Intel XE#9115]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-ptl-2/igt@xe_waitfence@reltime.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * IGT: IGT_9100 -> IGT_9101
  * Linux: xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05 -> xe-pw-174512v1

  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9101: 16e3ae670fa6c3ee97f113c688a172bb0f6034e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05: 15f7465765dc45d58738fc05a1c11a785e709c05
  xe-pw-174512v1: 174512v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/index.html

--===============4678005702007714175==
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
<tr><td><b>Series:</b></td><td>drm/xe/vm: nuke PTs only after unlinking contested VMAs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174512/">https://patchwork.freedesktop.org/series/174512/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05_BAT -&gt; xe-pw-174512v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174512v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-174512v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-174512v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174512v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9100 -&gt; IGT_9101</li>
<li>Linux: xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05 -&gt; xe-pw-174512v1</li>
</ul>
<p>IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9101: 16e3ae670fa6c3ee97f113c688a172bb0f6034e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05: 15f7465765dc45d58738fc05a1c11a785e709c05<br />
  xe-pw-174512v1: 174512v1</p>

</body>
</html>

--===============4678005702007714175==--
