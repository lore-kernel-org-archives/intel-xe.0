Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC2DEB365A
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 03:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3796D10E049;
	Tue,  3 Mar 2026 03:01:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9AE10E049;
 Tue,  3 Mar 2026 03:01:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6602593550077542387=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/guc=3A_Fail_immediat?=
 =?utf-8?q?ely_on_GuC_load_error_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 03:01:32 -0000
Message-ID: <177250689286.306092.13789242206054313674@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303001732.2540493-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260303001732.2540493-2-daniele.ceraolospurio@intel.com>
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

--===============6602593550077542387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Fail immediately on GuC load error (rev2)
URL   : https://patchwork.freedesktop.org/series/161860/
State : failure

== Summary ==

CI Bug Log - changes from xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc_BAT -> xe-pw-161860v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161860v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161860v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161860v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-161860v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-bmg-2:          [PASS][5] -> [DMESG-WARN][6] ([Intel XE#7433]) +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-1:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#7433]) +2 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_module_load@load:
    - bat-bmg-3:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#7433])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-3/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/bat-bmg-3/igt@xe_module_load@load.html

  
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433


Build changes
-------------

  * IGT: IGT_8776 -> IGT_8777
  * Linux: xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc -> xe-pw-161860v2

  IGT_8776: 8776
  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc: df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc
  xe-pw-161860v2: 161860v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/index.html

--===============6602593550077542387==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Fail immediately on GuC load error (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161860/">https://patchwork.freedesktop.org/series/161860/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc_BAT -&gt; xe-pw-161860v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161860v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161860v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161860v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161860v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) +2 other tests dmesg-warn</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v2/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8776 -&gt; IGT_8777</li>
<li>Linux: xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc -&gt; xe-pw-161860v2</li>
</ul>
<p>IGT_8776: 8776<br />
  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc: df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc<br />
  xe-pw-161860v2: 161860v2</p>

</body>
</html>

--===============6602593550077542387==--
