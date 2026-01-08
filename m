Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A482D148AE
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 07:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B37310E69B;
	Thu,  8 Jan 2026 07:05:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D69B10E699;
 Thu,  8 Jan 2026 07:05:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2388653429809704183=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Remove_device_private_pages?=
 =?utf-8?q?_from_physical_address_space_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jordan Niethe" <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Jan 2026 07:05:09 -0000
Message-ID: <176785590951.135415.14837243728768855380@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108060102.41357-1-jniethe@nvidia.com>
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
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

--===============2388653429809704183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove device private pages from physical address space (rev4)
URL   : https://patchwork.freedesktop.org/series/159738/
State : failure

== Summary ==

CI Bug Log - changes from xe-4343-25815d6185d3efe226238025baddf01299c4b070_BAT -> xe-pw-159738v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159738v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159738v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159738v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-small:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/bat-bmg-2/igt@xe_evict@evict-beng-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/bat-bmg-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - bat-bmg-3:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-159738v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] ([Intel XE#6519])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4343-25815d6185d3efe226238025baddf01299c4b070 -> xe-pw-159738v4

  IGT_8692: 8692
  xe-4343-25815d6185d3efe226238025baddf01299c4b070: 25815d6185d3efe226238025baddf01299c4b070
  xe-pw-159738v4: 159738v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/index.html

--===============2388653429809704183==
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
<tr><td><b>Series:</b></td><td>Remove device private pages from physical address space (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159738/">https://patchwork.freedesktop.org/series/159738/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4343-25815d6185d3efe226238025baddf01299c4b070_BAT -&gt; xe-pw-159738v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159738v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159738v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159738v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/bat-bmg-2/igt@xe_evict@evict-beng-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/bat-bmg-2/igt@xe_evict@evict-beng-small.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159738v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4343-25815d6185d3efe226238025baddf01299c4b070 -&gt; xe-pw-159738v4</li>
</ul>
<p>IGT_8692: 8692<br />
  xe-4343-25815d6185d3efe226238025baddf01299c4b070: 25815d6185d3efe226238025baddf01299c4b070<br />
  xe-pw-159738v4: 159738v4</p>

</body>
</html>

--===============2388653429809704183==--
