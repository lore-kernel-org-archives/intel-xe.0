Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C83ACA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 10:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C2F10E254;
	Mon,  5 Oct 2026 10:56:30 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F0910E254;
 Mon,  5 Oct 2026 10:56:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1664365598662634459=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_support_to_handle_memor?=
 =?utf-8?q?y_double-bit_ecc_errors_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Oct 2026 10:56:29 -0000
Message-ID: <179119778952.239763.2773986547863820664@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261005090156.1233748-8-riana.tauro@intel.com>
In-Reply-To: <20261005090156.1233748-8-riana.tauro@intel.com>
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

--===============1664365598662634459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support to handle memory double-bit ecc errors (rev4)
URL   : https://patchwork.freedesktop.org/series/172710/
State : success

== Summary ==

CI Bug Log - changes from xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0_BAT -> xe-pw-172710v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9126 -> IGT_9127
  * Linux: xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0 -> xe-pw-172710v4

  IGT_9126: 4b27241425f55826ff2df54686e8e709f5baf9dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9127: 9127
  xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0: b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0
  xe-pw-172710v4: 172710v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v4/index.html

--===============1664365598662634459==
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
<tr><td><b>Series:</b></td><td>Add support to handle memory double-bit ecc errors (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172710/">https://patchwork.freedesktop.org/series/172710/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0_BAT -&gt; xe-pw-172710v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9126 -&gt; IGT_9127</li>
<li>Linux: xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0 -&gt; xe-pw-172710v4</li>
</ul>
<p>IGT_9126: 4b27241425f55826ff2df54686e8e709f5baf9dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9127: 9127<br />
  xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0: b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0<br />
  xe-pw-172710v4: 172710v4</p>

</body>
</html>

--===============1664365598662634459==--
