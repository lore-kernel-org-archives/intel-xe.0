Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A58C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 06:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81BB10FF77;
	Fri,  8 Mar 2024 06:26:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7A310FF77;
 Fri,  8 Mar 2024 06:26:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7984441913427919711=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Refactor_VM_bind_code_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 06:26:59 -0000
Message-ID: <170987921904.611088.3766211450565421610@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308050806.577176-1-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
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

--===============7984441913427919711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor VM bind code (rev5)
URL   : https://patchwork.freedesktop.org/series/125608/
State : failure

== Summary ==

CI Bug Log - changes from xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b_BAT -> xe-pw-125608v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-125608v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-125608v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-125608v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_queue_property@invalid-property}:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
    - bat-atsm-2:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b -> xe-pw-125608v5

  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b: ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b
  xe-pw-125608v5: 125608v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/index.html

--===============7984441913427919711==
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
<tr><td><b>Series:</b></td><td>Refactor VM bind code (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125608/">https://patchwork.freedesktop.org/series/125608/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b_BAT -&gt; xe-pw-125608v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-125608v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-125608v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-125608v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">INCOMPLETE</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_queue_property@invalid-property}:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b -&gt; xe-pw-125608v5</li>
</ul>
<p>IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b: ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b<br />
  xe-pw-125608v5: 125608v5</p>

</body>
</html>

--===============7984441913427919711==--
