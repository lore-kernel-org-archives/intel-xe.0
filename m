Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFF5CD6E4A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 15:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FC2112B34;
	Thu,  4 Jun 2026 15:17:19 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D257112A6D;
 Thu,  4 Jun 2026 15:17:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4905111900007258433=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/ggtt=3A_clear_reserv?=
 =?utf-8?q?ed_areas_at_init_runtime_for_!VFs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jun 2026 15:17:18 -0000
Message-ID: <178058623824.43098.10409773467274092929@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604134501.17302-1-dev@lankhorst.se>
In-Reply-To: <20260604134501.17302-1-dev@lankhorst.se>
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

--===============4905111900007258433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ggtt: clear reserved areas at init runtime for !VFs (rev2)
URL   : https://patchwork.freedesktop.org/series/167881/
State : failure

== Summary ==

CI Bug Log - changes from xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7_BAT -> xe-pw-167881v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167881v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167881v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167881v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-vm:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-bmg-vm/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-bmg-vm/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-2:          [PASS][5] -> [DMESG-WARN][6] +3 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-ptl-1:          [PASS][9] -> [DMESG-WARN][10] +3 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-2:          [PASS][11] -> [DMESG-WARN][12] +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-1:          [PASS][13] -> [DMESG-WARN][14] +3 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_module_load@load:
    - bat-atsm-2:         [PASS][15] -> [DMESG-WARN][16] +3 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-atsm-2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-atsm-2/igt@xe_module_load@load.html
    - bat-wcl-1:          [PASS][17] -> [DMESG-WARN][18] +3 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-wcl-1/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-wcl-1/igt@xe_module_load@load.html
    - bat-ptl-vm:         [PASS][19] -> [DMESG-WARN][20] +1 other test dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-ptl-vm/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-ptl-vm/igt@xe_module_load@load.html
    - bat-wcl-2:          [PASS][21] -> [DMESG-WARN][22] +3 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-wcl-2/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-wcl-2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][23] -> [DMESG-WARN][24] +1 other test dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-lnl-1/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][25] -> [DMESG-WARN][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-bmg-3/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-bmg-3/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7 -> xe-pw-167881v2

  IGT_8948: 8948
  xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7: 9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7
  xe-pw-167881v2: 167881v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/index.html

--===============4905111900007258433==
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
<tr><td><b>Series:</b></td><td>drm/xe/ggtt: clear reserved areas at init runtime for !VFs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167881/">https://patchwork.freedesktop.org/series/167881/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7_BAT -&gt; xe-pw-167881v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167881v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167881v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167881v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-bmg-vm/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-bmg-vm/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-wcl-1/igt@xe_module_load@load.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-ptl-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-ptl-vm/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-wcl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-wcl-2/igt@xe_module_load@load.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167881v2/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7 -&gt; xe-pw-167881v2</li>
</ul>
<p>IGT_8948: 8948<br />
  xe-5203-9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7: 9dd27c9ba89acc30350aa57fe047b9a2fd0a5ee7<br />
  xe-pw-167881v2: 167881v2</p>

</body>
</html>

--===============4905111900007258433==--
