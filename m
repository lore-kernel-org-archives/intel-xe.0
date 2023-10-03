Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7DEE776DB
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 19:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E2B10E2E2;
	Tue,  3 Oct 2023 19:01:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C800410E2E2;
 Tue,  3 Oct 2023 19:01:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C200AAADF3;
 Tue,  3 Oct 2023 19:01:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4590123191162367754=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Tue, 03 Oct 2023 19:01:51 -0000
Message-ID: <169635971178.4381.1351376395433449665@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Port_CPU-?=
 =?utf-8?q?GPU_timestamp_correlation_to_XE_KMD?=
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

--===============4590123191162367754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Port CPU-GPU timestamp correlation to XE KMD
URL   : https://patchwork.freedesktop.org/series/124565/
State : failure

== Summary ==

CI Bug Log - changes from xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36_BAT -> xe-pw-124565v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-124565v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-124565v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-124565v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@bad-pitch-256:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-256.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] +42 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-adlp-7:         [PASS][5] -> [TIMEOUT][6] +5 other tests timeout
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-leak}:
    - bat-adlp-7:         [PASS][7] -> [WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_create@create-execqueues-leak.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#524]) -> [WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][11] -> [FAIL][12] +11 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
Known issues
------------

  Here are the changes found in xe-pw-124565v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-adlp-7:         [PASS][13] -> [FAIL][14] ([Intel XE#715])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/715


Build changes
-------------

  * Linux: xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36 -> xe-pw-124565v1

  IGT_7510: a4b4a33d8312e4e30ca23d26bbd1758e56540e1d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36: 090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36
  xe-pw-124565v1: 124565v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/index.html

--===============4590123191162367754==
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
<tr><td><b>Series:</b></td><td>Port CPU-GPU timestamp correlation to XE KMD</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124565/">https://patchwork.freedesktop.org/series/124565/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36_BAT -&gt; xe-pw-124565v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-124565v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-124565v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-124565v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-256:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-256.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">FAIL</a> +42 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">TIMEOUT</a> +5 other tests timeout</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">WARN</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">WARN</a></li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124565v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124565v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/715">Intel XE#715</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36 -&gt; xe-pw-124565v1</li>
</ul>
<p>IGT_7510: a4b4a33d8312e4e30ca23d26bbd1758e56540e1d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36: 090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36<br />
  xe-pw-124565v1: 124565v1</p>

</body>
</html>

--===============4590123191162367754==--
