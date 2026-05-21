Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA5CCD343F
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 06:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01E110F21D;
	Thu, 21 May 2026 06:58:56 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B0110F21D;
 Thu, 21 May 2026 06:58:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4013554754072610062=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_return_type_a?=
 =?utf-8?q?nd_adjust_variable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohanram Meenakshisundaram" <mohanram.meenakshisundaram@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 May 2026 06:58:55 -0000
Message-ID: <177934673573.94258.12607786758895057195@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260521060338.2112191-1-mohanram.meenakshisundaram@intel.com>
In-Reply-To: <20260521060338.2112191-1-mohanram.meenakshisundaram@intel.com>
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

--===============4013554754072610062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix return type and adjust variable
URL   : https://patchwork.freedesktop.org/series/166981/
State : success

== Summary ==

CI Bug Log - changes from xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed_BAT -> xe-pw-166981v1_BAT
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

  * IGT: IGT_8926 -> IGT_8927
  * Linux: xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed -> xe-pw-166981v1

  IGT_8926: 8926
  IGT_8927: 3adedfd3a52fa7cdf94df31e5da59e0fdbda92fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed: a7f4472d401c5c4ee7710c20b7350b6958b8bbed
  xe-pw-166981v1: 166981v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/index.html

--===============4013554754072610062==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix return type and adjust variable</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166981/">https://patchwork.freedesktop.org/series/166981/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed_BAT -&gt; xe-pw-166981v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8926 -&gt; IGT_8927</li>
<li>Linux: xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed -&gt; xe-pw-166981v1</li>
</ul>
<p>IGT_8926: 8926<br />
  IGT_8927: 3adedfd3a52fa7cdf94df31e5da59e0fdbda92fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed: a7f4472d401c5c4ee7710c20b7350b6958b8bbed<br />
  xe-pw-166981v1: 166981v1</p>

</body>
</html>

--===============4013554754072610062==--
