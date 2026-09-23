Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF57C98304
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 16:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A65410EEB0;
	Wed, 23 Sep 2026 16:06:31 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0A810F0D8;
 Wed, 23 Sep 2026 16:06:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7851482397504189047=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm=2C_drm/xe=3A_Protect_ag?=
 =?utf-8?q?ainst_premature_module_unloads?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Sep 2026 16:06:30 -0000
Message-ID: <179017959043.196549.9548669364704655102@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260923140844.390822-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260923140844.390822-1-thomas.hellstrom@linux.intel.com>
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

--===============7851482397504189047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm, drm/xe: Protect against premature module unloads
URL   : https://patchwork.freedesktop.org/series/174805/
State : success

== Summary ==

CI Bug Log - changes from xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4_BAT -> xe-pw-174805v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-174805v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#8007]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-bmg-2:          [DMESG-WARN][3] ([Intel XE#9331]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [DMESG-WARN][5] ([Intel XE#9331]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [DMESG-WARN][7] ([Intel XE#9331]) -> [PASS][8] +2 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - bat-bmg-3:          [DMESG-WARN][9] ([Intel XE#9331]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331


Build changes
-------------

  * Linux: xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4 -> xe-pw-174805v1

  IGT_9110: 9110
  xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4: 890d1157247d8ad65d9a2d44c065accd550b61f4
  xe-pw-174805v1: 174805v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/index.html

--===============7851482397504189047==
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
<tr><td><b>Series:</b></td><td>drm, drm/xe: Protect against premature module unloads</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174805/">https://patchwork.freedesktop.org/series/174805/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4_BAT -&gt; xe-pw-174805v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174805v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174805v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4 -&gt; xe-pw-174805v1</li>
</ul>
<p>IGT_9110: 9110<br />
  xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4: 890d1157247d8ad65d9a2d44c065accd550b61f4<br />
  xe-pw-174805v1: 174805v1</p>

</body>
</html>

--===============7851482397504189047==--
