Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572BFC531DF
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 16:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2963E10EB77;
	Thu, 22 Aug 2024 16:48:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEE810EB77;
 Thu, 22 Aug 2024 16:48:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7092840360475692158=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_conversion_t?=
 =?utf-8?q?o_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Aug 2024 16:48:33 -0000
Message-ID: <172434531349.726612.17554751435783503594@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1724342644.git.jani.nikula@intel.com>
In-Reply-To: <cover.1724342644.git.jani.nikula@intel.com>
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

--===============7092840360475692158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: conversion to struct intel_display
URL   : https://patchwork.freedesktop.org/series/137655/
State : success

== Summary ==

CI Bug Log - changes from xe-1815-882c26c7017bdcc4eca493c7bf1ffb034d40be02_BAT -> xe-pw-137655v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7983 -> IGT_7984
  * Linux: xe-1815-882c26c7017bdcc4eca493c7bf1ffb034d40be02 -> xe-pw-137655v1

  IGT_7983: b2e17acf37471073210221724a66d164328dee98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7984: 7984
  xe-1815-882c26c7017bdcc4eca493c7bf1ffb034d40be02: 882c26c7017bdcc4eca493c7bf1ffb034d40be02
  xe-pw-137655v1: 137655v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137655v1/index.html

--===============7092840360475692158==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: conversion to struct intel_display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137655/">https://patchwork.freedesktop.org/series/137655/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137655v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137655v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1815-882c26c7017bdcc4eca493c7bf1ffb034d40be02_BAT -&gt; xe-pw-137655v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7983 -&gt; IGT_7984</li>
<li>Linux: xe-1815-882c26c7017bdcc4eca493c7bf1ffb034d40be02 -&gt; xe-pw-137655v1</li>
</ul>
<p>IGT_7983: b2e17acf37471073210221724a66d164328dee98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7984: 7984<br />
  xe-1815-882c26c7017bdcc4eca493c7bf1ffb034d40be02: 882c26c7017bdcc4eca493c7bf1ffb034d40be02<br />
  xe-pw-137655v1: 137655v1</p>

</body>
</html>

--===============7092840360475692158==--
