Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B405FC28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 20:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACDE10E2A7;
	Thu, 20 Mar 2025 20:13:44 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DC610E2A7;
 Thu, 20 Mar 2025 20:13:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3567141013303651945=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_support_for_Mesa_GPU_ha?=
 =?utf-8?q?ng_replay_tool_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 20:13:43 -0000
Message-ID: <174250162349.60911.3112899084438449590@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250320192831.3842138-1-matthew.brost@intel.com>
In-Reply-To: <20250320192831.3842138-1-matthew.brost@intel.com>
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

--===============3567141013303651945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for Mesa GPU hang replay tool (rev3)
URL   : https://patchwork.freedesktop.org/series/143868/
State : failure

== Summary ==

CI Bug Log - changes from xe-2825-a958e31a81b3267201c85b6f171419586afa792c_BAT -> xe-pw-143868v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143868v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143868v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 8)
------------------------------

  Missing    (2): bat-pvc-2 bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143868v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_queue_property@invalid-property:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
    - bat-atsm-2:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-vf:        [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-adlp-vf/igt@xe_exec_queue_property@invalid-property.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-adlp-vf/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-1:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-bmg-2:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-7:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
    - bat-bmg-1:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-2:          [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html

  
Known issues
------------

  Here are the changes found in xe-pw-143868v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-adlp-vf:        [PASS][17] -> [ABORT][18] ([Intel XE#4491])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8275 -> IGT_8276
  * Linux: xe-2825-a958e31a81b3267201c85b6f171419586afa792c -> xe-pw-143868v3

  IGT_8275: a851348546d61620c263d3292148f67620efa7d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8276: 8276
  xe-2825-a958e31a81b3267201c85b6f171419586afa792c: a958e31a81b3267201c85b6f171419586afa792c
  xe-pw-143868v3: 143868v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/index.html

--===============3567141013303651945==
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
<tr><td><b>Series:</b></td><td>Add support for Mesa GPU hang replay tool (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143868/">https://patchwork.freedesktop.org/series/143868/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2825-a958e31a81b3267201c85b6f171419586afa792c_BAT -&gt; xe-pw-143868v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143868v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143868v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): bat-pvc-2 bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143868v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_queue_property@invalid-property:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-adlp-vf/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-adlp-vf/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143868v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-y:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143868v3/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8275 -&gt; IGT_8276</li>
<li>Linux: xe-2825-a958e31a81b3267201c85b6f171419586afa792c -&gt; xe-pw-143868v3</li>
</ul>
<p>IGT_8275: a851348546d61620c263d3292148f67620efa7d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8276: 8276<br />
  xe-2825-a958e31a81b3267201c85b6f171419586afa792c: a958e31a81b3267201c85b6f171419586afa792c<br />
  xe-pw-143868v3: 143868v3</p>

</body>
</html>

--===============3567141013303651945==--
