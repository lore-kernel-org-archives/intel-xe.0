Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371C2C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 23:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E0210F83F;
	Thu, 21 Mar 2024 23:08:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EC910F83F;
 Thu, 21 Mar 2024 23:08:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5363427176903842756=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Check_error_code_w?=
 =?utf-8?q?hen_initializing_the_CT_mutex?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 23:08:58 -0000
Message-ID: <171106253886.941104.12473388021769930184@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321195512.274210-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240321195512.274210-1-daniele.ceraolospurio@intel.com>
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

--===============5363427176903842756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Check error code when initializing the CT mutex
URL   : https://patchwork.freedesktop.org/series/131451/
State : success

== Summary ==

CI Bug Log - changes from xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962_BAT -> xe-pw-131451v1_BAT
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

  * IGT: IGT_7775 -> IGT_7776
  * Linux: xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962 -> xe-pw-131451v1

  IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7776: 7776
  xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962: ad4a10c6d0e21df4bd830c20c96b795ae2d03962
  xe-pw-131451v1: 131451v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131451v1/index.html

--===============5363427176903842756==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Check error code when initializing the CT mutex</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131451/">https://patchwork.freedesktop.org/series/131451/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131451v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131451v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962_BAT -&gt; xe-pw-131451v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7775 -&gt; IGT_7776</li>
<li>Linux: xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962 -&gt; xe-pw-131451v1</li>
</ul>
<p>IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7776: 7776<br />
  xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962: ad4a10c6d0e21df4bd830c20c96b795ae2d03962<br />
  xe-pw-131451v1: 131451v1</p>

</body>
</html>

--===============5363427176903842756==--
