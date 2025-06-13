Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049E2C71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 06:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C1410E82A;
	Fri, 13 Jun 2025 06:51:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170C110E82A;
 Fri, 13 Jun 2025 06:51:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0579370504148311973=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Improve_handling_of_aborted?=
 =?utf-8?q?_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 06:51:55 -0000
Message-ID: <174979751508.74819.11405059014468610792@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612220937.857-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250612220937.857-1-michal.wajdeczko@intel.com>
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

--===============0579370504148311973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve handling of aborted probe
URL   : https://patchwork.freedesktop.org/series/150190/
State : success

== Summary ==

CI Bug Log - changes from xe-3245-190bbece34ea123c98a27f5692e8ce8e9559200e_BAT -> xe-pw-150190v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3245-190bbece34ea123c98a27f5692e8ce8e9559200e -> xe-pw-150190v1

  IGT_8410: 5826cdbf1cb8f5ec8a42bae33deb6b2b63e59e6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3245-190bbece34ea123c98a27f5692e8ce8e9559200e: 190bbece34ea123c98a27f5692e8ce8e9559200e
  xe-pw-150190v1: 150190v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150190v1/index.html

--===============0579370504148311973==
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
<tr><td><b>Series:</b></td><td>Improve handling of aborted probe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150190/">https://patchwork.freedesktop.org/series/150190/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150190v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150190v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3245-190bbece34ea123c98a27f5692e8ce8e9559200e_BAT -&gt; xe-pw-150190v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3245-190bbece34ea123c98a27f5692e8ce8e9559200e -&gt; xe-pw-150190v1</li>
</ul>
<p>IGT_8410: 5826cdbf1cb8f5ec8a42bae33deb6b2b63e59e6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3245-190bbece34ea123c98a27f5692e8ce8e9559200e: 190bbece34ea123c98a27f5692e8ce8e9559200e<br />
  xe-pw-150190v1: 150190v1</p>

</body>
</html>

--===============0579370504148311973==--
