Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F61C61DBD
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 01:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4D710E34B;
	Thu, 27 Aug 2026 01:35:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291A410E34B;
 Thu, 27 Aug 2026 01:35:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1461728177332540515=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/3?=
 =?utf-8?q?=5D_drm/xe/uc=3A_Report_DMA_failure_using_SIGID?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Aug 2026 01:35:44 -0000
Message-ID: <178779454414.89324.1207063410193399963@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
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

--===============1461728177332540515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe/uc: Report DMA failure using SIGID
URL   : https://patchwork.freedesktop.org/series/172830/
State : success

== Summary ==

CI Bug Log - changes from xe-5650-7c56ac46313c75cab25c1e9b7bc4cbf40644b044_BAT -> xe-pw-172830v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5650-7c56ac46313c75cab25c1e9b7bc4cbf40644b044 -> xe-pw-172830v1

  IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5650-7c56ac46313c75cab25c1e9b7bc4cbf40644b044: 7c56ac46313c75cab25c1e9b7bc4cbf40644b044
  xe-pw-172830v1: 172830v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172830v1/index.html

--===============1461728177332540515==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe/uc: Report DMA failure using SIGID</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172830/">https://patchwork.freedesktop.org/series/172830/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172830v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172830v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5650-7c56ac46313c75cab25c1e9b7bc4cbf40644b044_BAT -&gt; xe-pw-172830v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5650-7c56ac46313c75cab25c1e9b7bc4cbf40644b044 -&gt; xe-pw-172830v1</li>
</ul>
<p>IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5650-7c56ac46313c75cab25c1e9b7bc4cbf40644b044: 7c56ac46313c75cab25c1e9b7bc4cbf40644b044<br />
  xe-pw-172830v1: 172830v1</p>

</body>
</html>

--===============1461728177332540515==--
