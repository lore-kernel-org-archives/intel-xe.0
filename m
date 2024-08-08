Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62857C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 21:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAAD10E81F;
	Thu,  8 Aug 2024 21:35:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E83110E81F;
 Thu,  8 Aug 2024 21:35:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4825986591012888282=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Parallel_submission_of_dma_fence?=
 =?utf-8?q?_jobs_and_LR_jobs_with_shared_hardware_resources_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 21:35:54 -0000
Message-ID: <172315295431.550585.8686570754620677142@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808184220.1715625-1-francois.dugast@intel.com>
In-Reply-To: <20240808184220.1715625-1-francois.dugast@intel.com>
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

--===============4825986591012888282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev8)
URL   : https://patchwork.freedesktop.org/series/136192/
State : failure

== Summary ==

CI Bug Log - changes from xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961_BAT -> xe-pw-136192v8_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136192v8_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136192v8_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136192v8_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-small-multi-vm:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/bat-bmg-1/igt@xe_evict@evict-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v8/bat-bmg-1/igt@xe_evict@evict-small-multi-vm.html

  


Build changes
-------------

  * Linux: xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961 -> xe-pw-136192v8

  IGT_7962: 7962
  xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961: 6eced4bb82542c5f00a48e4d7b66a10905736961
  xe-pw-136192v8: 136192v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v8/index.html

--===============4825986591012888282==
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
<tr><td><b>Series:</b></td><td>Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136192/">https://patchwork.freedesktop.org/series/136192/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961_BAT -&gt; xe-pw-136192v8_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136192v8_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136192v8_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136192v8_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict@evict-small-multi-vm:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/bat-bmg-1/igt@xe_evict@evict-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v8/bat-bmg-1/igt@xe_evict@evict-small-multi-vm.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961 -&gt; xe-pw-136192v8</li>
</ul>
<p>IGT_7962: 7962<br />
  xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961: 6eced4bb82542c5f00a48e4d7b66a10905736961<br />
  xe-pw-136192v8: 136192v8</p>

</body>
</html>

--===============4825986591012888282==--
