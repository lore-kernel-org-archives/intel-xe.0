Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E9CC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 21:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80582112178;
	Thu, 21 Mar 2024 21:39:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A705D112175;
 Thu, 21 Mar 2024 21:39:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2485512486740037585=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Remove_explicit_sh?=
 =?utf-8?q?utdown_of_SLPC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 21:39:13 -0000
Message-ID: <171105715368.940819.10973308625850501026@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321184924.234579-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240321184924.234579-1-vinay.belgaumkar@intel.com>
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

--===============2485512486740037585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Remove explicit shutdown of SLPC
URL   : https://patchwork.freedesktop.org/series/131449/
State : success

== Summary ==

CI Bug Log - changes from xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962_BAT -> xe-pw-131449v1_BAT
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

  * Linux: xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962 -> xe-pw-131449v1

  IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962: ad4a10c6d0e21df4bd830c20c96b795ae2d03962
  xe-pw-131449v1: 131449v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131449v1/index.html

--===============2485512486740037585==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Remove explicit shutdown of SLPC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131449/">https://patchwork.freedesktop.org/series/131449/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131449v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131449v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962_BAT -&gt; xe-pw-131449v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962 -&gt; xe-pw-131449v1</li>
</ul>
<p>IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962: ad4a10c6d0e21df4bd830c20c96b795ae2d03962<br />
  xe-pw-131449v1: 131449v1</p>

</body>
</html>

--===============2485512486740037585==--
