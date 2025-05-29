Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D61FC5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 19:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E6B10E21B;
	Thu, 29 May 2025 19:07:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35CF10E03F;
 Thu, 29 May 2025 19:07:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4277979299406424669=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vsec=3A_fix_CONFIG?=
 =?utf-8?q?=5FINTEL=5FVSEC_dependency_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 May 2025 19:07:00 -0000
Message-ID: <174854562086.32035.13809560474829796271@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529172355.2395634-2-lucas.demarchi@intel.com>
In-Reply-To: <20250529172355.2395634-2-lucas.demarchi@intel.com>
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

--===============4277979299406424669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency (rev2)
URL   : https://patchwork.freedesktop.org/series/149427/
State : success

== Summary ==

CI Bug Log - changes from xe-3160-1bf8ab359843448c553ec50b86348e26d2eb93ae_BAT -> xe-pw-149427v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3160-1bf8ab359843448c553ec50b86348e26d2eb93ae -> xe-pw-149427v2

  IGT_8384: 8384
  xe-3160-1bf8ab359843448c553ec50b86348e26d2eb93ae: 1bf8ab359843448c553ec50b86348e26d2eb93ae
  xe-pw-149427v2: 149427v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149427v2/index.html

--===============4277979299406424669==
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
<tr><td><b>Series:</b></td><td>drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149427/">https://patchwork.freedesktop.org/series/149427/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149427v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149427v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3160-1bf8ab359843448c553ec50b86348e26d2eb93ae_BAT -&gt; xe-pw-149427v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3160-1bf8ab359843448c553ec50b86348e26d2eb93ae -&gt; xe-pw-149427v2</li>
</ul>
<p>IGT_8384: 8384<br />
  xe-3160-1bf8ab359843448c553ec50b86348e26d2eb93ae: 1bf8ab359843448c553ec50b86348e26d2eb93ae<br />
  xe-pw-149427v2: 149427v2</p>

</body>
</html>

--===============4277979299406424669==--
