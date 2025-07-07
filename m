Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59B0C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 16:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C8410E4F2;
	Mon,  7 Jul 2025 16:58:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4094A10E4F5;
 Mon,  7 Jul 2025 16:58:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5023596549677087753=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/gem=3A_Fix_race_in_drm=5Fgem=5Fhandle=5Fcreate=5Ftail=28?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simona Vetter" <simona.vetter@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Jul 2025 16:58:00 -0000
Message-ID: <175190748025.140789.7147326160495789151@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707151814.603897-1-simona.vetter@ffwll.ch>
In-Reply-To: <20250707151814.603897-1-simona.vetter@ffwll.ch>
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

--===============5023596549677087753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/gem: Fix race in drm_gem_handle_create_tail()
URL   : https://patchwork.freedesktop.org/series/151277/
State : success

== Summary ==

CI Bug Log - changes from xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3_BAT -> xe-pw-151277v1_BAT
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

  * Linux: xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3 -> xe-pw-151277v1

  IGT_8445: 8445
  xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3: acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3
  xe-pw-151277v1: 151277v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/index.html

--===============5023596549677087753==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/gem: Fix race in drm_gem_handle_create_tail()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151277/">https://patchwork.freedesktop.org/series/151277/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3_BAT -&gt; xe-pw-151277v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3 -&gt; xe-pw-151277v1</li>
</ul>
<p>IGT_8445: 8445<br />
  xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3: acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3<br />
  xe-pw-151277v1: 151277v1</p>

</body>
</html>

--===============5023596549677087753==--
