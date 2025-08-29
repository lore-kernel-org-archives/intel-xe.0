Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A160DCA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 16:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C91410E094;
	Fri, 29 Aug 2025 16:30:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423B910E094;
 Fri, 29 Aug 2025 16:29:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1524929167104770814=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_for-CI=3A_Replace_xe=5Fhmm_?=
 =?utf-8?q?with_gpusvm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Aug 2025 16:29:59 -0000
Message-ID: <175648499926.285520.10217778605685133417@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829153728.707899-2-matthew.auld@intel.com>
In-Reply-To: <20250829153728.707899-2-matthew.auld@intel.com>
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

--===============1524929167104770814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: for-CI: Replace xe_hmm with gpusvm
URL   : https://patchwork.freedesktop.org/series/153721/
State : success

== Summary ==

CI Bug Log - changes from xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0_BAT -> xe-pw-153721v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in xe-pw-153721v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - {bat-ptl-1}:        [DMESG-WARN][1] ([Intel XE#5772]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - {bat-ptl-2}:        [DMESG-WARN][3] ([Intel XE#5772]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][5] ([Intel XE#5783]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
    - {bat-ptl-vm}:       [FAIL][7] ([Intel XE#5783]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5772
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0 -> xe-pw-153721v1

  IGT_8516: 8516
  xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0: b2118a7804aff7dbee98b80a755d3b473d3febc0
  xe-pw-153721v1: 153721v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/index.html

--===============1524929167104770814==
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
<tr><td><b>Series:</b></td><td>for-CI: Replace xe_hmm with gpusvm</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153721/">https://patchwork.freedesktop.org/series/153721/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0_BAT -&gt; xe-pw-153721v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153721v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5772">Intel XE#5772</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5772">Intel XE#5772</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153721v1/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0 -&gt; xe-pw-153721v1</li>
</ul>
<p>IGT_8516: 8516<br />
  xe-3638-b2118a7804aff7dbee98b80a755d3b473d3febc0: b2118a7804aff7dbee98b80a755d3b473d3febc0<br />
  xe-pw-153721v1: 153721v1</p>

</body>
</html>

--===============1524929167104770814==--
