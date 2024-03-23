Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC8EC54E58
	for <intel-xe@archiver.kernel.org>; Sat, 23 Mar 2024 05:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD58B10E9DB;
	Sat, 23 Mar 2024 05:28:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99CA10E5F5;
 Sat, 23 Mar 2024 05:28:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6143649254315955128=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_static_analysis_to?=
 =?utf-8?q?ol_reported_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 23 Mar 2024 05:28:14 -0000
Message-ID: <171117169469.1016878.12850473989436154671@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240323044822.2632787-1-karthik.poosa@intel.com>
In-Reply-To: <20240323044822.2632787-1-karthik.poosa@intel.com>
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

--===============6143649254315955128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix static analysis tool reported errors
URL   : https://patchwork.freedesktop.org/series/131529/
State : success

== Summary ==

CI Bug Log - changes from xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1_BAT -> xe-pw-131529v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1 -> xe-pw-131529v1

  IGT_7778: 0f63f0cf1fefbf7933ca33441c7a89966e85d8c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1: 657dd8fcd2f1d1205c6f98fdb8b60915228991d1
  xe-pw-131529v1: 131529v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131529v1/index.html

--===============6143649254315955128==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix static analysis tool reported errors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131529/">https://patchwork.freedesktop.org/series/131529/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131529v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131529v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1_BAT -&gt; xe-pw-131529v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1 -&gt; xe-pw-131529v1</li>
</ul>
<p>IGT_7778: 0f63f0cf1fefbf7933ca33441c7a89966e85d8c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1: 657dd8fcd2f1d1205c6f98fdb8b60915228991d1<br />
  xe-pw-131529v1: 131529v1</p>

</body>
</html>

--===============6143649254315955128==--
