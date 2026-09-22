Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFFFC98306
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 12:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E5D10E483;
	Tue, 22 Sep 2026 12:26:29 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC0E10E483;
 Tue, 22 Sep 2026 12:26:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1423377090521904238=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Isolate_wedged_de?=
 =?utf-8?q?vices_from_hardware_access_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Sep 2026 12:26:29 -0000
Message-ID: <179007998916.192893.1772650689325185316@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922101721.1583542-1-arvind.yadav@intel.com>
In-Reply-To: <20260922101721.1583542-1-arvind.yadav@intel.com>
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

--===============1423377090521904238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Isolate wedged devices from hardware access (rev2)
URL   : https://patchwork.freedesktop.org/series/172860/
State : failure

== Summary ==

CI Bug Log - changes from xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d_BAT -> xe-pw-172860v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172860v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172860v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172860v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-2:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-1:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-atsm-2:         [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
    - bat-wcl-1:          [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-1:          [PASS][15] -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-wcl-2:          [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][19] -> [DMESG-WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-172860v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#8762] / [Intel XE#9069])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
    - bat-nvls-2:         [PASS][23] -> [DMESG-WARN][24] ([Intel XE#8762] / [Intel XE#9069])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-vm:         [PASS][25] -> [DMESG-WARN][26] ([Intel XE#9331]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  * igt@xe_exec_system_allocator@twice-free:
    - bat-bmg-1:          [PASS][27] -> [DMESG-WARN][28] ([Intel XE#9331])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][29] -> [FAIL][30] ([Intel XE#9109])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-ptl-2/igt@xe_waitfence@engine.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-ptl-2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [DMESG-WARN][31] ([Intel XE#9331]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [DMESG-WARN][33] ([Intel XE#9331]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331


Build changes
-------------

  * Linux: xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d -> xe-pw-172860v2

  IGT_9107: bba540a799a5f1a3c7ddc3a2b864678241377773 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d: 0433becdcbca8f779a8d32040a26718f2442e62d
  xe-pw-172860v2: 172860v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/index.html

--===============1423377090521904238==
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
<tr><td><b>Series:</b></td><td>drm/xe: Isolate wedged devices from hardware access (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172860/">https://patchwork.freedesktop.org/series/172860/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d_BAT -&gt; xe-pw-172860v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172860v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-172860v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-172860v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172860v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>)</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v2/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d -&gt; xe-pw-172860v2</li>
</ul>
<p>IGT_9107: bba540a799a5f1a3c7ddc3a2b864678241377773 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d: 0433becdcbca8f779a8d32040a26718f2442e62d<br />
  xe-pw-172860v2: 172860v2</p>

</body>
</html>

--===============1423377090521904238==--
