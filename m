Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE20C36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 22:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6E510E33E;
	Fri,  4 Apr 2025 22:11:59 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B90310E035;
 Fri,  4 Apr 2025 22:11:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0580706771044754751=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Cleanup_GGTT_usag?=
 =?utf-8?q?e_outside_of_xe=5Fggtt=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 22:11:58 -0000
Message-ID: <174380471810.39791.7800562145716872382@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250404205028.620300-1-dev@lankhorst.se>
In-Reply-To: <20250404205028.620300-1-dev@lankhorst.se>
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

--===============0580706771044754751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Cleanup GGTT usage outside of xe_ggtt.c
URL   : https://patchwork.freedesktop.org/series/147281/
State : success

== Summary ==

CI Bug Log - changes from xe-2906-15ac66651307aa3178e5ff8fc7d62b97f2092d09_BAT -> xe-pw-147281v1_BAT
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

  * IGT: IGT_8307 -> IGT_8309
  * Linux: xe-2906-15ac66651307aa3178e5ff8fc7d62b97f2092d09 -> xe-pw-147281v1

  IGT_8307: a4e3c079328d3bfb2f071eae5ed93db3334c8cc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8309: fb77fb2d8d58a2539c9d67d00e1747351eec0bea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2906-15ac66651307aa3178e5ff8fc7d62b97f2092d09: 15ac66651307aa3178e5ff8fc7d62b97f2092d09
  xe-pw-147281v1: 147281v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147281v1/index.html

--===============0580706771044754751==
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
<tr><td><b>Series:</b></td><td>drm/xe: Cleanup GGTT usage outside of xe_ggtt.c</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147281/">https://patchwork.freedesktop.org/series/147281/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147281v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147281v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2906-15ac66651307aa3178e5ff8fc7d62b97f2092d09_BAT -&gt; xe-pw-147281v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8307 -&gt; IGT_8309</li>
<li>Linux: xe-2906-15ac66651307aa3178e5ff8fc7d62b97f2092d09 -&gt; xe-pw-147281v1</li>
</ul>
<p>IGT_8307: a4e3c079328d3bfb2f071eae5ed93db3334c8cc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8309: fb77fb2d8d58a2539c9d67d00e1747351eec0bea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2906-15ac66651307aa3178e5ff8fc7d62b97f2092d09: 15ac66651307aa3178e5ff8fc7d62b97f2092d09<br />
  xe-pw-147281v1: 147281v1</p>

</body>
</html>

--===============0580706771044754751==--
