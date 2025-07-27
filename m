Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE4AC87FCC
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 07:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A745E10E2F0;
	Sun, 27 Jul 2025 07:51:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8931110E2AB;
 Sun, 27 Jul 2025 07:51:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2839775388028164418=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Mark_xe_driver_as_BROKEN_if?=
 =?utf-8?q?_kernel_page_size_is_not_4kB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <Simon.Richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 27 Jul 2025 07:51:29 -0000
Message-ID: <175360268945.192467.1452840290915504754@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250727070413.9743-1-Simon.Richter@hogyros.de>
In-Reply-To: <20250727070413.9743-1-Simon.Richter@hogyros.de>
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

--===============2839775388028164418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Mark xe driver as BROKEN if kernel page size is not 4kB
URL   : https://patchwork.freedesktop.org/series/152145/
State : success

== Summary ==

CI Bug Log - changes from xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04_BAT -> xe-pw-152145v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 7)
------------------------------

  Missing    (2): bat-adlp-vm bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04 -> xe-pw-152145v1

  IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04: 11e629e8c02307977802ba0ea8c60ddb15b17d04
  xe-pw-152145v1: 152145v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v1/index.html

--===============2839775388028164418==
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
<tr><td><b>Series:</b></td><td>Mark xe driver as BROKEN if kernel page size is not 4kB</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152145/">https://patchwork.freedesktop.org/series/152145/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152145v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04_BAT -&gt; xe-pw-152145v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Missing    (2): bat-adlp-vm bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04 -&gt; xe-pw-152145v1</li>
</ul>
<p>IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04: 11e629e8c02307977802ba0ea8c60ddb15b17d04<br />
  xe-pw-152145v1: 152145v1</p>

</body>
</html>

--===============2839775388028164418==--
