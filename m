Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F57E743EC
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 06:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF1610E0E0;
	Fri, 29 Sep 2023 06:13:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0D5110E0DD;
 Fri, 29 Sep 2023 06:13:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A0D97AADDD;
 Fri, 29 Sep 2023 06:13:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5544215231603462662=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 29 Sep 2023 06:13:47 -0000
Message-ID: <169596802762.19498.10922072085191564964@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929044959.3149265-1-lucas.demarchi@intel.com>
In-Reply-To: <20230929044959.3149265-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe?=
 =?utf-8?q?2=3A_Extend_reserved_stolen_sizes?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============5544215231603462662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Extend reserved stolen sizes
URL   : https://patchwork.freedesktop.org/series/124429/
State : success

== Summary ==

CI Bug Log - changes from xe-400-fbc31f75dbdcdcea60b7f5ba5c8d7efbc0ec75ef_BAT -> xe-pw-124429v1_BAT
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

  * Linux: xe-400-fbc31f75dbdcdcea60b7f5ba5c8d7efbc0ec75ef -> xe-pw-124429v1

  IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-400-fbc31f75dbdcdcea60b7f5ba5c8d7efbc0ec75ef: fbc31f75dbdcdcea60b7f5ba5c8d7efbc0ec75ef
  xe-pw-124429v1: 124429v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124429v1/index.html

--===============5544215231603462662==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Extend reserved stolen sizes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124429/">https://patchwork.freedesktop.org/series/124429/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124429v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124429v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-400-fbc31f75dbdcdcea60b7f5ba5c8d7efbc0ec75ef_BAT -&gt; xe-pw-124429v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-400-fbc31f75dbdcdcea60b7f5ba5c8d7efbc0ec75ef -&gt; xe-pw-124429v1</li>
</ul>
<p>IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-400-fbc31f75dbdcdcea60b7f5ba5c8d7efbc0ec75ef: fbc31f75dbdcdcea60b7f5ba5c8d7efbc0ec75ef<br />
  xe-pw-124429v1: 124429v1</p>

</body>
</html>

--===============5544215231603462662==--
