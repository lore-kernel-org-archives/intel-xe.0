Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EB2E78D70
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 09:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1910210E3AA;
	Mon,  9 Feb 2026 09:16:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B1510E3B3;
 Mon,  9 Feb 2026 09:16:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3787338751523507616=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv3?=
 =?utf-8?q?=2C1/2=5D_drm/buddy=3A_Improve_offset-aligned_allocation_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Feb 2026 09:16:46 -0000
Message-ID: <177062860699.236896.13632645231055952232@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260209083051.13376-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260209083051.13376-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============3787338751523507616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/2] drm/buddy: Improve offset-aligned allocation handling
URL   : https://patchwork.freedesktop.org/series/161338/
State : success

== Summary ==

CI Bug Log - changes from xe-4524-1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36_BAT -> xe-pw-161338v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4524-1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36 -> xe-pw-161338v1

  IGT_8744: 8744
  xe-4524-1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36: 1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36
  xe-pw-161338v1: 161338v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161338v1/index.html

--===============3787338751523507616==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/2] drm/buddy: Improve offset-aligned allocation handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161338/">https://patchwork.freedesktop.org/series/161338/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161338v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161338v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4524-1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36_BAT -&gt; xe-pw-161338v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4524-1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36 -&gt; xe-pw-161338v1</li>
</ul>
<p>IGT_8744: 8744<br />
  xe-4524-1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36: 1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36<br />
  xe-pw-161338v1: 161338v1</p>

</body>
</html>

--===============3787338751523507616==--
