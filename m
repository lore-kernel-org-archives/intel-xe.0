Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4692AC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 00:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE29310EADC;
	Fri, 23 Feb 2024 00:48:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1140B10EADC;
 Fri, 23 Feb 2024 00:48:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2322732971070718673=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/uapi=3A_Remove_unused_fla?=
 =?utf-8?q?gs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Feb 2024 00:48:39 -0000
Message-ID: <170864931906.217031.4774197984538227907@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222232356.175431-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240222232356.175431-1-rodrigo.vivi@intel.com>
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

--===============2322732971070718673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Remove unused flags (rev4)
URL   : https://patchwork.freedesktop.org/series/129781/
State : failure

== Summary ==

CI Bug Log - changes from xe-831-5e139b8dd8049fee9f42fe76c603b5cfc286af7f_BAT -> xe-pw-129781v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-129781v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-129781v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129781v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +9 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-831-5e139b8dd8049fee9f42fe76c603b5cfc286af7f/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v4/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  
Known issues
------------

  Here are the changes found in xe-pw-129781v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-WARN][4] ([Intel XE#1009])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-831-5e139b8dd8049fee9f42fe76c603b5cfc286af7f/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v4/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  
  [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009


Build changes
-------------

  * IGT: IGT_7726 -> IGT_7727
  * Linux: xe-831-5e139b8dd8049fee9f42fe76c603b5cfc286af7f -> xe-pw-129781v4

  IGT_7726: 7726
  IGT_7727: 7727
  xe-831-5e139b8dd8049fee9f42fe76c603b5cfc286af7f: 5e139b8dd8049fee9f42fe76c603b5cfc286af7f
  xe-pw-129781v4: 129781v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v4/index.html

--===============2322732971070718673==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Remove unused flags (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129781/">https://patchwork.freedesktop.org/series/129781/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-831-5e139b8dd8049fee9f42fe76c603b5cfc286af7f_BAT -&gt; xe-pw-129781v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-129781v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-129781v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129781v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-831-5e139b8dd8049fee9f42fe76c603b5cfc286af7f/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v4/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129781v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-mixed-threads-small-multi-vm:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-831-5e139b8dd8049fee9f42fe76c603b5cfc286af7f/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v4/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009">Intel XE#1009</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7726 -&gt; IGT_7727</li>
<li>Linux: xe-831-5e139b8dd8049fee9f42fe76c603b5cfc286af7f -&gt; xe-pw-129781v4</li>
</ul>
<p>IGT_7726: 7726<br />
  IGT_7727: 7727<br />
  xe-831-5e139b8dd8049fee9f42fe76c603b5cfc286af7f: 5e139b8dd8049fee9f42fe76c603b5cfc286af7f<br />
  xe-pw-129781v4: 129781v4</p>

</body>
</html>

--===============2322732971070718673==--
