Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120B0C982EA
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 03:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EEC10E067;
	Mon, 21 Sep 2026 03:06:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E404E10E067;
 Mon, 21 Sep 2026 03:06:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9145198058659628669=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/dp=3A_Disable_DC5/?=
 =?utf-8?q?6_before_AUX_programming_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 03:06:22 -0000
Message-ID: <178995998292.185327.14594803729642679757@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
In-Reply-To: <20260918060426.1162123-1-suraj.kandpal@intel.com>
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

--===============9145198058659628669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Disable DC5/6 before AUX programming (rev3)
URL   : https://patchwork.freedesktop.org/series/174474/
State : failure

== Summary ==

CI Bug Log - changes from xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7_BAT -> xe-pw-174474v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174474v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174474v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174474v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  
Known issues
------------

  Here are the changes found in xe-pw-174474v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][3] -> [ABORT][4] ([Intel XE#8007])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@madvise-atomic-inc:
    - bat-bmg-vm:         [DMESG-WARN][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7 -> xe-pw-174474v3

  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7: fd2ca2a0c165980cac3a07afa88032da881db2d7
  xe-pw-174474v3: 174474v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/index.html

--===============9145198058659628669==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Disable DC5/6 before AUX programming (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174474/">https://patchwork.freedesktop.org/series/174474/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7_BAT -&gt; xe-pw-174474v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174474v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-174474v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-174474v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@many-execqueues-free:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174474v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_system_allocator@madvise-atomic-inc:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7 -&gt; xe-pw-174474v3</li>
</ul>
<p>IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7: fd2ca2a0c165980cac3a07afa88032da881db2d7<br />
  xe-pw-174474v3: 174474v3</p>

</body>
</html>

--===============9145198058659628669==--
