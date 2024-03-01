Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DB9C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 04:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5BD10EAB0;
	Fri,  1 Mar 2024 04:39:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7AD10EAAF;
 Fri,  1 Mar 2024 04:39:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0871682559969589748=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_xe=5Fsync_and_ufence_rework_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Mar 2024 04:39:09 -0000
Message-ID: <170926794930.434921.9570419182782226764@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301035522.238307-1-matthew.brost@intel.com>
In-Reply-To: <20240301035522.238307-1-matthew.brost@intel.com>
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

--===============0871682559969589748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_sync and ufence rework (rev2)
URL   : https://patchwork.freedesktop.org/series/130418/
State : failure

== Summary ==

CI Bug Log - changes from xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774_BAT -> xe-pw-130418v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-130418v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-130418v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-130418v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130418v2/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
Known issues
------------

  Here are the changes found in xe-pw-130418v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-atsm-2:         [PASS][3] -> [INCOMPLETE][4] ([Intel XE#804])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130418v2/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-adlp-7:         [PASS][5] -> [INCOMPLETE][6] ([Intel XE#925])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130418v2/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html

  
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804
  [Intel XE#925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/925


Build changes
-------------

  * Linux: xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774 -> xe-pw-130418v2

  IGT_7738: 7738
  xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774: c1a0f6caf0ffa81e77e74e04d937605a2e293774
  xe-pw-130418v2: 130418v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130418v2/index.html

--===============0871682559969589748==
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
<tr><td><b>Series:</b></td><td>xe_sync and ufence rework (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130418/">https://patchwork.freedesktop.org/series/130418/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130418v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130418v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774_BAT -&gt; xe-pw-130418v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-130418v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-130418v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-130418v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130418v2/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130418v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130418v2/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130418v2/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/925">Intel XE#925</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774 -&gt; xe-pw-130418v2</li>
</ul>
<p>IGT_7738: 7738<br />
  xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774: c1a0f6caf0ffa81e77e74e04d937605a2e293774<br />
  xe-pw-130418v2: 130418v2</p>

</body>
</html>

--===============0871682559969589748==--
