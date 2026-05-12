Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DDECD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 21:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7883010E2C8;
	Tue, 12 May 2026 21:42:49 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799B010E2C8;
 Tue, 12 May 2026 21:42:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7193579580348327435=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_cold_reset_recove?=
 =?utf-8?q?ry_method_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 21:42:47 -0000
Message-ID: <177862216748.64493.16859860167074494525@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512132614.1793083-7-mallesh.koujalagi@intel.com>
In-Reply-To: <20260512132614.1793083-7-mallesh.koujalagi@intel.com>
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

--===============7193579580348327435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce cold reset recovery method (rev4)
URL   : https://patchwork.freedesktop.org/series/163428/
State : success

== Summary ==

CI Bug Log - changes from xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86_BAT -> xe-pw-163428v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86 -> xe-pw-163428v4

  IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86: 9cb559e83f7f3c02c8c6566d3446cd37ecc56e86
  xe-pw-163428v4: 163428v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v4/index.html

--===============7193579580348327435==
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
<tr><td><b>Series:</b></td><td>Introduce cold reset recovery method (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163428/">https://patchwork.freedesktop.org/series/163428/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86_BAT -&gt; xe-pw-163428v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86 -&gt; xe-pw-163428v4</li>
</ul>
<p>IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86: 9cb559e83f7f3c02c8c6566d3446cd37ecc56e86<br />
  xe-pw-163428v4: 163428v4</p>

</body>
</html>

--===============7193579580348327435==--
