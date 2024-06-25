Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EF0C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 17:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBCA10E002;
	Tue, 25 Jun 2024 17:49:51 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D2110E002;
 Tue, 25 Jun 2024 17:49:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4799583499390679912=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Capture_per_client_stats_when_de?=
 =?utf-8?q?stroying_an_exec_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 17:49:49 -0000
Message-ID: <171933778999.157680.16205581134165799995@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
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

--===============4799583499390679912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Capture per client stats when destroying an exec queue
URL   : https://patchwork.freedesktop.org/series/135372/
State : failure

== Summary ==

CI Bug Log - changes from xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3_BAT -> xe-pw-135372v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135372v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135372v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135372v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/bat-atsm-2/igt@xe_pat@pat-index-xelp@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/bat-atsm-2/igt@xe_pat@pat-index-xelp@render.html

  
Known issues
------------

  Here are the changes found in xe-pw-135372v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_intel_bb@bb-with-allocator:
    - bat-atsm-2:         [DMESG-WARN][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/bat-atsm-2/igt@xe_intel_bb@bb-with-allocator.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/bat-atsm-2/igt@xe_intel_bb@bb-with-allocator.html

  


Build changes
-------------

  * IGT: IGT_7898 -> IGT_7900
  * Linux: xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3 -> xe-pw-135372v1

  IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3: 61dfb30a52fac9b1bb455a250799611682334cc3
  xe-pw-135372v1: 135372v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/index.html

--===============4799583499390679912==
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
<tr><td><b>Series:</b></td><td>Capture per client stats when destroying an exec queue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135372/">https://patchwork.freedesktop.org/series/135372/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3_BAT -&gt; xe-pw-135372v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135372v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135372v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135372v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/bat-atsm-2/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/bat-atsm-2/igt@xe_pat@pat-index-xelp@render.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135372v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@bb-with-allocator:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/bat-atsm-2/igt@xe_intel_bb@bb-with-allocator.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/bat-atsm-2/igt@xe_intel_bb@bb-with-allocator.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7898 -&gt; IGT_7900</li>
<li>Linux: xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3 -&gt; xe-pw-135372v1</li>
</ul>
<p>IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3: 61dfb30a52fac9b1bb455a250799611682334cc3<br />
  xe-pw-135372v1: 135372v1</p>

</body>
</html>

--===============4799583499390679912==--
