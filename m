Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCDBC27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 17:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F6F89B70;
	Tue, 11 Jun 2024 17:32:05 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FB910E689;
 Tue, 11 Jun 2024 17:32:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0863985791724296151=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Add_xe=5Fgt=5Fclock=5F?=
 =?utf-8?q?interval=5Fto=5Fms_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 17:32:04 -0000
Message-ID: <171812712432.68617.7263311220136059056@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611160846.2812036-1-matthew.brost@intel.com>
In-Reply-To: <20240611160846.2812036-1-matthew.brost@intel.com>
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

--===============0863985791724296151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add xe_gt_clock_interval_to_ms helper
URL   : https://patchwork.freedesktop.org/series/134728/
State : success

== Summary ==

CI Bug Log - changes from xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3_BAT -> xe-pw-134728v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7881 -> IGT_7882
  * Linux: xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3 -> xe-pw-134728v1

  IGT_7881: 7881
  IGT_7882: 257418cba11c724111fe0e983649763c407e5bc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3: 950ce28fe0b31a24c5bddcc337aba9554a41cbb3
  xe-pw-134728v1: 134728v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134728v1/index.html

--===============0863985791724296151==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add xe_gt_clock_interval_to_ms helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134728/">https://patchwork.freedesktop.org/series/134728/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134728v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134728v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3_BAT -&gt; xe-pw-134728v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7881 -&gt; IGT_7882</li>
<li>Linux: xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3 -&gt; xe-pw-134728v1</li>
</ul>
<p>IGT_7881: 7881<br />
  IGT_7882: 257418cba11c724111fe0e983649763c407e5bc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3: 950ce28fe0b31a24c5bddcc337aba9554a41cbb3<br />
  xe-pw-134728v1: 134728v1</p>

</body>
</html>

--===============0863985791724296151==--
