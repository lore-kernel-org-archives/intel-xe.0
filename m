Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CA0C2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 13:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B5310E7F9;
	Wed, 21 May 2025 13:57:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF1611A7AE;
 Wed, 21 May 2025 13:04:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3791786773104180324=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915_=26_drm/xe=3A_allo?=
 =?utf-8?q?cate_struct_intel=5Fdisplay_dynamically?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 13:04:29 -0000
Message-ID: <174783266963.9735.1211880249474377422@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1747822630.git.jani.nikula@intel.com>
In-Reply-To: <cover.1747822630.git.jani.nikula@intel.com>
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

--===============3791786773104180324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915 & drm/xe: allocate struct intel_display dynamically
URL   : https://patchwork.freedesktop.org/series/149318/
State : failure

== Summary ==

CI Bug Log - changes from xe-3118-72b5b862a7983153a866cc84cbcafdab8aaf3bf9_BAT -> xe-pw-149318v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149318v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149318v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-149318v1_BAT prevented too many machines from booting.

  Missing    (9): bat-bmg-1 bat-lnl-2 bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-vm bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3118-72b5b862a7983153a866cc84cbcafdab8aaf3bf9 -> xe-pw-149318v1

  IGT_8371: 8371
  xe-3118-72b5b862a7983153a866cc84cbcafdab8aaf3bf9: 72b5b862a7983153a866cc84cbcafdab8aaf3bf9
  xe-pw-149318v1: 149318v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149318v1/index.html

--===============3791786773104180324==
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
<tr><td><b>Series:</b></td><td>drm/i915 &amp; drm/xe: allocate struct intel_display dynamically</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149318/">https://patchwork.freedesktop.org/series/149318/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149318v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149318v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3118-72b5b862a7983153a866cc84cbcafdab8aaf3bf9_BAT -&gt; xe-pw-149318v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149318v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149318v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-149318v1_BAT prevented too many machines from booting.</p>
<p>Missing    (9): bat-bmg-1 bat-lnl-2 bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-vm bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3118-72b5b862a7983153a866cc84cbcafdab8aaf3bf9 -&gt; xe-pw-149318v1</li>
</ul>
<p>IGT_8371: 8371<br />
  xe-3118-72b5b862a7983153a866cc84cbcafdab8aaf3bf9: 72b5b862a7983153a866cc84cbcafdab8aaf3bf9<br />
  xe-pw-149318v1: 149318v1</p>

</body>
</html>

--===============3791786773104180324==--
