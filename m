Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0202FC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 06:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E5A10E296;
	Tue, 25 Jun 2024 06:34:20 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D3010E25C;
 Tue, 25 Jun 2024 06:34:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2083389043270656728=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Add_timeout_to_preempt?=
 =?utf-8?q?_fences_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 06:34:20 -0000
Message-ID: <171929726003.154922.2826553639825158884@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625055120.3997338-1-matthew.brost@intel.com>
In-Reply-To: <20240625055120.3997338-1-matthew.brost@intel.com>
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

--===============2083389043270656728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add timeout to preempt fences (rev3)
URL   : https://patchwork.freedesktop.org/series/135329/
State : success

== Summary ==

CI Bug Log - changes from xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b_BAT -> xe-pw-135329v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b -> xe-pw-135329v3

  IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b: cf83cd8ff370955a504fdf1388ea6e257da76a8b
  xe-pw-135329v3: 135329v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135329v3/index.html

--===============2083389043270656728==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add timeout to preempt fences (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135329/">https://patchwork.freedesktop.org/series/135329/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135329v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135329v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b_BAT -&gt; xe-pw-135329v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b -&gt; xe-pw-135329v3</li>
</ul>
<p>IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b: cf83cd8ff370955a504fdf1388ea6e257da76a8b<br />
  xe-pw-135329v3: 135329v3</p>

</body>
</html>

--===============2083389043270656728==--
