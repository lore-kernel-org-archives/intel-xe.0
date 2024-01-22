Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6055C47DDC
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 22:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B62610E4AE;
	Mon, 22 Jan 2024 22:52:00 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7318610E4AE;
 Mon, 22 Jan 2024 22:51:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2726281427211224927=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Add_GuC_based_regi?=
 =?utf-8?q?ster_capture_for_error_capture_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Date: Mon, 22 Jan 2024 22:51:59 -0000
Message-ID: <170596391946.665201.6904899010723361050@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122212557.55929-1-zhanjun.dong@intel.com>
In-Reply-To: <20240122212557.55929-1-zhanjun.dong@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============2726281427211224927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add GuC based register capture for error capture (rev3)
URL   : https://patchwork.freedesktop.org/series/128077/
State : failure

== Summary ==

CI Bug Log - changes from xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c_BAT -> xe-pw-128077v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-128077v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-128077v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-128077v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [PASS][3] -> [DMESG-WARN][4] +6 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c/bat-dg2-oem2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][7] -> [DMESG-WARN][8] +7 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c/bat-atsm-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/bat-atsm-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-128077v3_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-atsm-2:         [SKIP][9] ([Intel XE#1130]) -> [SKIP][10] ([Intel XE#288])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html

  
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * Linux: xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c -> xe-pw-128077v3

  IGT_7685: 7685
  xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c: 7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c
  xe-pw-128077v3: 128077v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/index.html

--===============2726281427211224927==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add GuC based register capture for error capture (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128077/">https://patchwork.freedesktop.org/series/128077/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c_BAT -&gt; xe-pw-128077v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-128077v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-128077v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-128077v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128077v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v3/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c -&gt; xe-pw-128077v3</li>
</ul>
<p>IGT_7685: 7685<br />
  xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c: 7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c<br />
  xe-pw-128077v3: 128077v3</p>

</body>
</html>

--===============2726281427211224927==--
