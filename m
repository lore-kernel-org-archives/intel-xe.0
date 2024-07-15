Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B779C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 10:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C2E10E32C;
	Mon, 15 Jul 2024 10:34:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDDC10E32C;
 Mon, 15 Jul 2024 10:34:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7790887755612382580=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_RFC_drm/xe/xe=5Fgt=5Fidle=3A_Exp?=
 =?utf-8?q?ose_Coarse_power_gating_sysfs_entries?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Jul 2024 10:34:50 -0000
Message-ID: <172103969024.217590.2888316521722473220@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240715095455.4069296-1-riana.tauro@intel.com>
In-Reply-To: <20240715095455.4069296-1-riana.tauro@intel.com>
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

--===============7790887755612382580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC drm/xe/xe_gt_idle: Expose Coarse power gating sysfs entries
URL   : https://patchwork.freedesktop.org/series/136085/
State : success

== Summary ==

CI Bug Log - changes from xe-1609-2e6ff4968b6b2a2ffcc8f3ef99693b28fae8ba87_BAT -> xe-pw-136085v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 5)
------------------------------

  Missing    (2): bat-lnl-2 bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1609-2e6ff4968b6b2a2ffcc8f3ef99693b28fae8ba87 -> xe-pw-136085v1

  IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1609-2e6ff4968b6b2a2ffcc8f3ef99693b28fae8ba87: 2e6ff4968b6b2a2ffcc8f3ef99693b28fae8ba87
  xe-pw-136085v1: 136085v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136085v1/index.html

--===============7790887755612382580==
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
<tr><td><b>Series:</b></td><td>RFC drm/xe/xe_gt_idle: Expose Coarse power gating sysfs entries</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136085/">https://patchwork.freedesktop.org/series/136085/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136085v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136085v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1609-2e6ff4968b6b2a2ffcc8f3ef99693b28fae8ba87_BAT -&gt; xe-pw-136085v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 5)</h2>
<p>Missing    (2): bat-lnl-2 bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1609-2e6ff4968b6b2a2ffcc8f3ef99693b28fae8ba87 -&gt; xe-pw-136085v1</li>
</ul>
<p>IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1609-2e6ff4968b6b2a2ffcc8f3ef99693b28fae8ba87: 2e6ff4968b6b2a2ffcc8f3ef99693b28fae8ba87<br />
  xe-pw-136085v1: 136085v1</p>

</body>
</html>

--===============7790887755612382580==--
