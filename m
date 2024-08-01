Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5F9C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 13:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0895310E975;
	Thu,  1 Aug 2024 13:41:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEF210E974;
 Thu,  1 Aug 2024 13:41:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1170221354973593562=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Parallel_submission_of_dma_fence?=
 =?utf-8?q?_jobs_and_LR_jobs_with_shared_hardware_resources_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 13:41:06 -0000
Message-ID: <172251966624.488075.10160320814925174817@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801125748.355078-1-francois.dugast@intel.com>
In-Reply-To: <20240801125748.355078-1-francois.dugast@intel.com>
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

--===============1170221354973593562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev4)
URL   : https://patchwork.freedesktop.org/series/136192/
State : failure

== Summary ==

CI Bug Log - changes from xe-1703-e6b1e3660d0168d9860e7cef487aba2bc21611bd_BAT -> xe-pw-136192v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136192v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136192v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (6 -> 6)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136192v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@bind-execqueues-independent:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1703-e6b1e3660d0168d9860e7cef487aba2bc21611bd/bat-bmg-1/igt@xe_vm@bind-execqueues-independent.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v4/bat-bmg-1/igt@xe_vm@bind-execqueues-independent.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_module_load@load:
    - {bat-lnl-2}:        [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1703-e6b1e3660d0168d9860e7cef487aba2bc21611bd/bat-lnl-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v4/bat-lnl-2/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-1703-e6b1e3660d0168d9860e7cef487aba2bc21611bd -> xe-pw-136192v4

  IGT_7950: 7950
  xe-1703-e6b1e3660d0168d9860e7cef487aba2bc21611bd: e6b1e3660d0168d9860e7cef487aba2bc21611bd
  xe-pw-136192v4: 136192v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v4/index.html

--===============1170221354973593562==
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
<tr><td><b>Series:</b></td><td>Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136192/">https://patchwork.freedesktop.org/series/136192/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1703-e6b1e3660d0168d9860e7cef487aba2bc21611bd_BAT -&gt; xe-pw-136192v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136192v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136192v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (6 -&gt; 6)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136192v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1703-e6b1e3660d0168d9860e7cef487aba2bc21611bd/bat-bmg-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v4/bat-bmg-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1703-e6b1e3660d0168d9860e7cef487aba2bc21611bd/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v4/bat-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1703-e6b1e3660d0168d9860e7cef487aba2bc21611bd -&gt; xe-pw-136192v4</li>
</ul>
<p>IGT_7950: 7950<br />
  xe-1703-e6b1e3660d0168d9860e7cef487aba2bc21611bd: e6b1e3660d0168d9860e7cef487aba2bc21611bd<br />
  xe-pw-136192v4: 136192v4</p>

</body>
</html>

--===============1170221354973593562==--
