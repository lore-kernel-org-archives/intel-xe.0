Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEC0C83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 17:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB60810E040;
	Thu, 24 Jul 2025 17:43:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17DB10E040;
 Thu, 24 Jul 2025 17:43:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2486267025527964308=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/uc=3A_Add_xe=5Fuc=5F?=
 =?utf-8?q?stop_on_hardware_initialization_error_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Jul 2025 17:43:39 -0000
Message-ID: <175337901984.187679.1911774386105338366@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250724152500.110367-1-zhanjun.dong@intel.com>
In-Reply-To: <20250724152500.110367-1-zhanjun.dong@intel.com>
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

--===============2486267025527964308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uc: Add xe_uc_stop on hardware initialization error handling
URL   : https://patchwork.freedesktop.org/series/152079/
State : success

== Summary ==

CI Bug Log - changes from xe-3470-2fe30dbc18cd98a593fa26398fe0147381ca716a_BAT -> xe-pw-152079v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3470-2fe30dbc18cd98a593fa26398fe0147381ca716a -> xe-pw-152079v1

  IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3470-2fe30dbc18cd98a593fa26398fe0147381ca716a: 2fe30dbc18cd98a593fa26398fe0147381ca716a
  xe-pw-152079v1: 152079v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152079v1/index.html

--===============2486267025527964308==
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
<tr><td><b>Series:</b></td><td>drm/xe/uc: Add xe_uc_stop on hardware initialization error handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152079/">https://patchwork.freedesktop.org/series/152079/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152079v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152079v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3470-2fe30dbc18cd98a593fa26398fe0147381ca716a_BAT -&gt; xe-pw-152079v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3470-2fe30dbc18cd98a593fa26398fe0147381ca716a -&gt; xe-pw-152079v1</li>
</ul>
<p>IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3470-2fe30dbc18cd98a593fa26398fe0147381ca716a: 2fe30dbc18cd98a593fa26398fe0147381ca716a<br />
  xe-pw-152079v1: 152079v1</p>

</body>
</html>

--===============2486267025527964308==--
