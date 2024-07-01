Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6481C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 20:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAEF10E1E5;
	Mon,  1 Jul 2024 20:23:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D627E10E1E5;
 Mon,  1 Jul 2024 20:23:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4752647557709425083=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe2lpm=3A_Extend_Wa=5F160?=
 =?utf-8?q?21639441?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ngai-Mint Kwan" <ngai-mint.kwan@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 20:23:05 -0000
Message-ID: <171986538586.3639.17424921856063851881@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701184637.531794-1-ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20240701184637.531794-1-ngai-mint.kwan@linux.intel.com>
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

--===============4752647557709425083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2lpm: Extend Wa_16021639441
URL   : https://patchwork.freedesktop.org/series/135612/
State : success

== Summary ==

CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -> xe-pw-135612v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7907 -> IGT_7908
  * Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -> xe-pw-135612v1

  IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7908: 7908
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299
  xe-pw-135612v1: 135612v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/index.html

--===============4752647557709425083==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2lpm: Extend Wa_16021639441</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135612/">https://patchwork.freedesktop.org/series/135612/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -&gt; xe-pw-135612v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7907 -&gt; IGT_7908</li>
<li>Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -&gt; xe-pw-135612v1</li>
</ul>
<p>IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7908: 7908<br />
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299<br />
  xe-pw-135612v1: 135612v1</p>

</body>
</html>

--===============4752647557709425083==--
