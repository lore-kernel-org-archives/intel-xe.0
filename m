Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F87ECD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 07:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C5E88EFE;
	Thu,  7 May 2026 07:45:04 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460C688EFE;
 Thu,  7 May 2026 07:45:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6698055885297844983=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Refactor_functions_implemen?=
 =?utf-8?q?ting_the_blt_batch_buffer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 May 2026 07:45:03 -0000
Message-ID: <177813990328.46664.10496951317120642809@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260507064229.397673-5-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260507064229.397673-5-balasubramani.vivekanandan@intel.com>
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

--===============6698055885297844983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor functions implementing the blt batch buffer
URL   : https://patchwork.freedesktop.org/series/166104/
State : success

== Summary ==

CI Bug Log - changes from xe-5007-ad7a1f718b8cb631948c94f74dd48cd2867d99fb_BAT -> xe-pw-166104v1_BAT
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

  * IGT: IGT_8894 -> IGT_8899
  * Linux: xe-5007-ad7a1f718b8cb631948c94f74dd48cd2867d99fb -> xe-pw-166104v1

  IGT_8894: 044f2c8744a52317c4651b4ca9d3b12f5be51575 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5007-ad7a1f718b8cb631948c94f74dd48cd2867d99fb: ad7a1f718b8cb631948c94f74dd48cd2867d99fb
  xe-pw-166104v1: 166104v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166104v1/index.html

--===============6698055885297844983==
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
<tr><td><b>Series:</b></td><td>Refactor functions implementing the blt batch buffer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166104/">https://patchwork.freedesktop.org/series/166104/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166104v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166104v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5007-ad7a1f718b8cb631948c94f74dd48cd2867d99fb_BAT -&gt; xe-pw-166104v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8894 -&gt; IGT_8899</li>
<li>Linux: xe-5007-ad7a1f718b8cb631948c94f74dd48cd2867d99fb -&gt; xe-pw-166104v1</li>
</ul>
<p>IGT_8894: 044f2c8744a52317c4651b4ca9d3b12f5be51575 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5007-ad7a1f718b8cb631948c94f74dd48cd2867d99fb: ad7a1f718b8cb631948c94f74dd48cd2867d99fb<br />
  xe-pw-166104v1: 166104v1</p>

</body>
</html>

--===============6698055885297844983==--
