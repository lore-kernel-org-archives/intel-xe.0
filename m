Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885DFC28B28
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 06:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391CE10E02B;
	Thu, 13 Mar 2025 06:35:30 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEB110E02B;
 Thu, 13 Mar 2025 06:35:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3635576789659829500=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/svm=3A_Add_stats_for?=
 =?utf-8?q?_SVM_page_faults_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Mar 2025 06:35:28 -0000
Message-ID: <174184772816.27877.5638990424920081502@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312092749.164232-1-francois.dugast@intel.com>
In-Reply-To: <20250312092749.164232-1-francois.dugast@intel.com>
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

--===============3635576789659829500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/svm: Add stats for SVM page faults (rev3)
URL   : https://patchwork.freedesktop.org/series/146196/
State : failure

== Summary ==

CI Bug Log - changes from xe-2800-741959c7dc5aaff75ea60a3cd9d6691abbd6534c_BAT -> xe-pw-146196v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-146196v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-146196v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-146196v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - bat-adlp-vf:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2800-741959c7dc5aaff75ea60a3cd9d6691abbd6534c/bat-adlp-vf/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146196v3/bat-adlp-vf/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-146196v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-rebind:
    - bat-adlp-vf:        [PASS][3] -> [ABORT][4] ([Intel XE#4491])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2800-741959c7dc5aaff75ea60a3cd9d6691abbd6534c/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146196v3/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * Linux: xe-2800-741959c7dc5aaff75ea60a3cd9d6691abbd6534c -> xe-pw-146196v3

  IGT_8271: 8271
  xe-2800-741959c7dc5aaff75ea60a3cd9d6691abbd6534c: 741959c7dc5aaff75ea60a3cd9d6691abbd6534c
  xe-pw-146196v3: 146196v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146196v3/index.html

--===============3635576789659829500==
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
<tr><td><b>Series:</b></td><td>drm/xe/svm: Add stats for SVM page faults (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146196/">https://patchwork.freedesktop.org/series/146196/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146196v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146196v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2800-741959c7dc5aaff75ea60a3cd9d6691abbd6534c_BAT -&gt; xe-pw-146196v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-146196v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-146196v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-146196v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@no-exec-cm-virtual-basic:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2800-741959c7dc5aaff75ea60a3cd9d6691abbd6534c/bat-adlp-vf/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146196v3/bat-adlp-vf/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146196v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2800-741959c7dc5aaff75ea60a3cd9d6691abbd6534c/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146196v3/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2800-741959c7dc5aaff75ea60a3cd9d6691abbd6534c -&gt; xe-pw-146196v3</li>
</ul>
<p>IGT_8271: 8271<br />
  xe-2800-741959c7dc5aaff75ea60a3cd9d6691abbd6534c: 741959c7dc5aaff75ea60a3cd9d6691abbd6534c<br />
  xe-pw-146196v3: 146196v3</p>

</body>
</html>

--===============3635576789659829500==--
