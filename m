Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB97C52D6F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 16:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4DB10E24D;
	Mon,  5 Aug 2024 16:24:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7210E24D;
 Mon,  5 Aug 2024 16:24:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5831399846553494353=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display_suspend/resume_fi?=
 =?utf-8?q?xes=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 16:24:21 -0000
Message-ID: <172287506120.540852.4973098978057382901@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
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

--===============5831399846553494353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display suspend/resume fixes.
URL   : https://patchwork.freedesktop.org/series/136891/
State : success

== Summary ==

CI Bug Log - changes from xe-1715-d15caf398bccf6c9d34363f65251b7192f833dc9_BAT -> xe-pw-136891v1_BAT
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

  * Linux: xe-1715-d15caf398bccf6c9d34363f65251b7192f833dc9 -> xe-pw-136891v1

  IGT_7956: dc7e77d1a8643f50832c38b4c8f8ddb598c0cf48 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1715-d15caf398bccf6c9d34363f65251b7192f833dc9: d15caf398bccf6c9d34363f65251b7192f833dc9
  xe-pw-136891v1: 136891v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136891v1/index.html

--===============5831399846553494353==
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
<tr><td><b>Series:</b></td><td>drm/xe/display suspend/resume fixes.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136891/">https://patchwork.freedesktop.org/series/136891/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136891v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136891v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1715-d15caf398bccf6c9d34363f65251b7192f833dc9_BAT -&gt; xe-pw-136891v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1715-d15caf398bccf6c9d34363f65251b7192f833dc9 -&gt; xe-pw-136891v1</li>
</ul>
<p>IGT_7956: dc7e77d1a8643f50832c38b4c8f8ddb598c0cf48 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1715-d15caf398bccf6c9d34363f65251b7192f833dc9: d15caf398bccf6c9d34363f65251b7192f833dc9<br />
  xe-pw-136891v1: 136891v1</p>

</body>
</html>

--===============5831399846553494353==--
