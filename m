Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E078CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F11610E038;
	Fri,  9 Oct 2026 12:03:31 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117E710E038;
 Fri,  9 Oct 2026 12:03:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6552156571778205424=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_CPER_logging_support_fo?=
 =?utf-8?q?r_CRI_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 12:03:30 -0000
Message-ID: <179154741006.3058.16332288170071367224@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
In-Reply-To: <20261009104602.1075405-14-badal.nilawar@intel.com>
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

--===============6552156571778205424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add CPER logging support for CRI (rev4)
URL   : https://patchwork.freedesktop.org/series/169692/
State : failure

== Summary ==

CI Bug Log - changes from xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e_BAT -> xe-pw-169692v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169692v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169692v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169692v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:
    - bat-wcl-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e/bat-wcl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v4/bat-wcl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch.html

  


Build changes
-------------

  * Linux: xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e -> xe-pw-169692v4

  IGT_9138: 9138
  xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e: 3bd4f625aafdf70814dbf075de96e224355c9f1e
  xe-pw-169692v4: 169692v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v4/index.html

--===============6552156571778205424==
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
<tr><td><b>Series:</b></td><td>Add CPER logging support for CRI (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169692/">https://patchwork.freedesktop.org/series/169692/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e_BAT -&gt; xe-pw-169692v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169692v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-169692v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-169692v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e/bat-wcl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v4/bat-wcl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e -&gt; xe-pw-169692v4</li>
</ul>
<p>IGT_9138: 9138<br />
  xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e: 3bd4f625aafdf70814dbf075de96e224355c9f1e<br />
  xe-pw-169692v4: 169692v4</p>

</body>
</html>

--===============6552156571778205424==--
