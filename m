Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCB9C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11F010E7CF;
	Tue, 13 Feb 2024 15:47:49 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4AC10E7D3;
 Tue, 13 Feb 2024 15:47:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0667374132548425657=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv4=2C1/4?=
 =?utf-8?q?=5D_drm/xe=3A_Add_uapi_for_dumpable_bos?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 15:47:48 -0000
Message-ID: <170783926811.1201024.17133258531837267523@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213145239.359679-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240213145239.359679-1-maarten.lankhorst@linux.intel.com>
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

--===============0667374132548425657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v4,1/4] drm/xe: Add uapi for dumpable bos
URL   : https://patchwork.freedesktop.org/series/129839/
State : success

== Summary ==

CI Bug Log - changes from xe-769-7c8e9135509f2e438e11a4af17387a204ab59884_BAT -> xe-pw-129839v1_BAT
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

  * IGT: IGT_7710 -> IGT_7711
  * Linux: xe-769-7c8e9135509f2e438e11a4af17387a204ab59884 -> xe-pw-129839v1

  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7711: 7711
  xe-769-7c8e9135509f2e438e11a4af17387a204ab59884: 7c8e9135509f2e438e11a4af17387a204ab59884
  xe-pw-129839v1: 129839v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129839v1/index.html

--===============0667374132548425657==
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
<tr><td><b>Series:</b></td><td>series starting with [v4,1/4] drm/xe: Add uapi for dumpable bos</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129839/">https://patchwork.freedesktop.org/series/129839/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129839v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129839v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-769-7c8e9135509f2e438e11a4af17387a204ab59884_BAT -&gt; xe-pw-129839v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7710 -&gt; IGT_7711</li>
<li>Linux: xe-769-7c8e9135509f2e438e11a4af17387a204ab59884 -&gt; xe-pw-129839v1</li>
</ul>
<p>IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7711: 7711<br />
  xe-769-7c8e9135509f2e438e11a4af17387a204ab59884: 7c8e9135509f2e438e11a4af17387a204ab59884<br />
  xe-pw-129839v1: 129839v1</p>

</body>
</html>

--===============0667374132548425657==--
