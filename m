Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13164F55449
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 03:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9582310E672;
	Wed, 25 Feb 2026 03:06:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D3E10E672;
 Wed, 25 Feb 2026 03:06:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2418126181040064324=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_platform/x86/intel/vsec=3A_?=
 =?utf-8?q?Prep_for_ACPI_PMT_discovery_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Feb 2026 03:06:23 -0000
Message-ID: <177198878326.284662.7785616983361926132@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260224-upstream-pmt-acpi-v5-v5-0-8dd73bcf049c@linux.intel.com>
In-Reply-To: <20260224-upstream-pmt-acpi-v5-v5-0-8dd73bcf049c@linux.intel.com>
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

--===============2418126181040064324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: platform/x86/intel/vsec: Prep for ACPI PMT discovery (rev5)
URL   : https://patchwork.freedesktop.org/series/159716/
State : failure

== Summary ==

CI Bug Log - changes from xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe_BAT -> xe-pw-159716v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159716v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159716v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 14)
------------------------------

  Additional (1): bat-bmg-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159716v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - bat-bmg-3:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  


Build changes
-------------

  * Linux: xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe -> xe-pw-159716v5

  IGT_8769: 8769
  xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe
  xe-pw-159716v5: 159716v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v5/index.html

--===============2418126181040064324==
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
<tr><td><b>Series:</b></td><td>platform/x86/intel/vsec: Prep for ACPI PMT discovery (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159716/">https://patchwork.freedesktop.org/series/159716/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe_BAT -&gt; xe-pw-159716v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159716v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159716v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 14)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159716v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe -&gt; xe-pw-159716v5</li>
</ul>
<p>IGT_8769: 8769<br />
  xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe<br />
  xe-pw-159716v5: 159716v5</p>

</body>
</html>

--===============2418126181040064324==--
