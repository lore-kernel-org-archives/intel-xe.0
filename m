Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2520BC982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 19:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B4610EE53;
	Tue, 22 Sep 2026 19:51:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E82F10EE40;
 Tue, 22 Sep 2026 19:51:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5274040824441121912=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/ptl=3A_Add_a_new_PTL?=
 =?utf-8?q?_PCI_ID_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Sep 2026 19:51:04 -0000
Message-ID: <179010666431.194524.7289482343958871228@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922165607.129560-2-violet.monti@intel.com>
In-Reply-To: <20260922165607.129560-2-violet.monti@intel.com>
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

--===============5274040824441121912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Add a new PTL PCI ID (rev2)
URL   : https://patchwork.freedesktop.org/series/174524/
State : success

== Summary ==

CI Bug Log - changes from xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7_BAT -> xe-pw-174524v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-174524v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#8762] / [Intel XE#9069])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#9331])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  * igt@xe_waitfence@reltime:
    - bat-wcl-2:          [PASS][5] -> [FAIL][6] ([Intel XE#9115])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-wcl-2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-wcl-2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@twice-free:
    - bat-bmg-1:          [DMESG-WARN][7] ([Intel XE#9331]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [TIMEOUT][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-atsm-2/igt@xe_waitfence@abstime.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-atsm-2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [FAIL][11] ([Intel XE#9115]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-ptl-2/igt@xe_waitfence@reltime.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331


Build changes
-------------

  * Linux: xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7 -> xe-pw-174524v2

  IGT_9108: 6e7f99cc82296e74e3986a4515506a7a8cea33df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7: 5e43615fc10b27f309fee90bad4e187452e5c0c7
  xe-pw-174524v2: 174524v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/index.html

--===============5274040824441121912==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Add a new PTL PCI ID (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174524/">https://patchwork.freedesktop.org/series/174524/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7_BAT -&gt; xe-pw-174524v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174524v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-wcl-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-wcl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-atsm-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174524v2/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7 -&gt; xe-pw-174524v2</li>
</ul>
<p>IGT_9108: 6e7f99cc82296e74e3986a4515506a7a8cea33df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5805-5e43615fc10b27f309fee90bad4e187452e5c0c7: 5e43615fc10b27f309fee90bad4e187452e5c0c7<br />
  xe-pw-174524v2: 174524v2</p>

</body>
</html>

--===============5274040824441121912==--
