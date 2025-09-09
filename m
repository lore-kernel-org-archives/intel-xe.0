Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78956CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 12:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3AC10E700;
	Tue,  9 Sep 2025 12:57:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495CB10E24C;
 Tue,  9 Sep 2025 12:57:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7688153162400957766=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv6?=
 =?utf-8?q?=2C1/3=5D_drm/buddy=3A_Optimize_free_block_management_with_RB_tre?=
 =?utf-8?q?e?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Sep 2025 12:57:09 -0000
Message-ID: <175742262929.317419.16269793949261604483@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250909115237.2644-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20250909115237.2644-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============7688153162400957766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v6,1/3] drm/buddy: Optimize free block management with RB tree
URL   : https://patchwork.freedesktop.org/series/154258/
State : success

== Summary ==

CI Bug Log - changes from xe-3708-a8f4348c7cf63d404fa5096efa146728750b3f3f_BAT -> xe-pw-154258v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3708-a8f4348c7cf63d404fa5096efa146728750b3f3f -> xe-pw-154258v1

  IGT_8526: 13cd231d5da440137bc5d1c26fd3f7c170ace253 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3708-a8f4348c7cf63d404fa5096efa146728750b3f3f: a8f4348c7cf63d404fa5096efa146728750b3f3f
  xe-pw-154258v1: 154258v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154258v1/index.html

--===============7688153162400957766==
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
<tr><td><b>Series:</b></td><td>series starting with [v6,1/3] drm/buddy: Optimize free block management with RB tree</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154258/">https://patchwork.freedesktop.org/series/154258/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154258v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154258v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3708-a8f4348c7cf63d404fa5096efa146728750b3f3f_BAT -&gt; xe-pw-154258v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3708-a8f4348c7cf63d404fa5096efa146728750b3f3f -&gt; xe-pw-154258v1</li>
</ul>
<p>IGT_8526: 13cd231d5da440137bc5d1c26fd3f7c170ace253 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3708-a8f4348c7cf63d404fa5096efa146728750b3f3f: a8f4348c7cf63d404fa5096efa146728750b3f3f<br />
  xe-pw-154258v1: 154258v1</p>

</body>
</html>

--===============7688153162400957766==--
