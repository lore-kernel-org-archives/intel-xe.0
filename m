Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B582D2D0E8
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 13:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F135D10E4C6;
	Tue, 13 Jan 2026 13:03:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A5E88CBF;
 Tue, 13 Jan 2026 13:03:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2352694343792704608=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Privatize_struct_?=
 =?utf-8?q?xe=5Fggtt=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jan 2026 13:03:35 -0000
Message-ID: <176830941561.150144.10455386619924237428@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260113121807.1303124-1-dev@lankhorst.se>
In-Reply-To: <20260113121807.1303124-1-dev@lankhorst.se>
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

--===============2352694343792704608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Privatize struct xe_ggtt. (rev2)
URL   : https://patchwork.freedesktop.org/series/160006/
State : success

== Summary ==

CI Bug Log - changes from xe-4376-f7424dfbcb8f05a13bb1da2bed8e2212d2b7a082_BAT -> xe-pw-160006v2_BAT
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

  * Linux: xe-4376-f7424dfbcb8f05a13bb1da2bed8e2212d2b7a082 -> xe-pw-160006v2

  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4376-f7424dfbcb8f05a13bb1da2bed8e2212d2b7a082: f7424dfbcb8f05a13bb1da2bed8e2212d2b7a082
  xe-pw-160006v2: 160006v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160006v2/index.html

--===============2352694343792704608==
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
<tr><td><b>Series:</b></td><td>drm/xe: Privatize struct xe_ggtt. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160006/">https://patchwork.freedesktop.org/series/160006/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160006v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160006v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4376-f7424dfbcb8f05a13bb1da2bed8e2212d2b7a082_BAT -&gt; xe-pw-160006v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4376-f7424dfbcb8f05a13bb1da2bed8e2212d2b7a082 -&gt; xe-pw-160006v2</li>
</ul>
<p>IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4376-f7424dfbcb8f05a13bb1da2bed8e2212d2b7a082: f7424dfbcb8f05a13bb1da2bed8e2212d2b7a082<br />
  xe-pw-160006v2: 160006v2</p>

</body>
</html>

--===============2352694343792704608==--
