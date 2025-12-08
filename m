Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C801BD3B7E2
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 14:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBB410E123;
	Mon,  8 Dec 2025 14:09:42 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5925A10E123;
 Mon,  8 Dec 2025 14:09:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8781193237321960026=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Redesign_survivability_mode?=
 =?utf-8?q?_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Dec 2025 14:09:40 -0000
Message-ID: <176520298035.66288.4230599086857592884@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251208084539.3652902-4-riana.tauro@intel.com>
In-Reply-To: <20251208084539.3652902-4-riana.tauro@intel.com>
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

--===============8781193237321960026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Redesign survivability mode (rev3)
URL   : https://patchwork.freedesktop.org/series/157425/
State : success

== Summary ==

CI Bug Log - changes from xe-4204-e04a4be1a156054fa00b25ef28848cf0df91453e_BAT -> xe-pw-157425v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4204-e04a4be1a156054fa00b25ef28848cf0df91453e -> xe-pw-157425v3

  IGT_8658: 5d645d459768a0e5c8e5e95b9fce16bb17319825 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4204-e04a4be1a156054fa00b25ef28848cf0df91453e: e04a4be1a156054fa00b25ef28848cf0df91453e
  xe-pw-157425v3: 157425v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157425v3/index.html

--===============8781193237321960026==
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
<tr><td><b>Series:</b></td><td>Redesign survivability mode (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157425/">https://patchwork.freedesktop.org/series/157425/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157425v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157425v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4204-e04a4be1a156054fa00b25ef28848cf0df91453e_BAT -&gt; xe-pw-157425v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4204-e04a4be1a156054fa00b25ef28848cf0df91453e -&gt; xe-pw-157425v3</li>
</ul>
<p>IGT_8658: 5d645d459768a0e5c8e5e95b9fce16bb17319825 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4204-e04a4be1a156054fa00b25ef28848cf0df91453e: e04a4be1a156054fa00b25ef28848cf0df91453e<br />
  xe-pw-157425v3: 157425v3</p>

</body>
</html>

--===============8781193237321960026==--
