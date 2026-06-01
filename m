Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41E7CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 17:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3C710E344;
	Mon,  1 Jun 2026 17:39:41 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F0F10E80D;
 Mon,  1 Jun 2026 17:39:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3366149084959865648=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/drrs=3A_Synchroniz?=
 =?utf-8?q?e_drrs_activate_with_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jun 2026 17:39:40 -0000
Message-ID: <178033558095.32237.7509403787240272869@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601144255.1481931-1-arun.r.murthy@intel.com>
In-Reply-To: <20260601144255.1481931-1-arun.r.murthy@intel.com>
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

--===============3366149084959865648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/drrs: Synchronize drrs activate with debugfs
URL   : https://patchwork.freedesktop.org/series/167673/
State : success

== Summary ==

CI Bug Log - changes from xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c_BAT -> xe-pw-167673v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c -> xe-pw-167673v1

  IGT_8943: 8943
  xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c: b64812e86f4a787e10be1ab9f48b9e6dab23376c
  xe-pw-167673v1: 167673v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167673v1/index.html

--===============3366149084959865648==
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
<tr><td><b>Series:</b></td><td>drm/i915/drrs: Synchronize drrs activate with debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167673/">https://patchwork.freedesktop.org/series/167673/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167673v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167673v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c_BAT -&gt; xe-pw-167673v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c -&gt; xe-pw-167673v1</li>
</ul>
<p>IGT_8943: 8943<br />
  xe-5173-b64812e86f4a787e10be1ab9f48b9e6dab23376c: b64812e86f4a787e10be1ab9f48b9e6dab23376c<br />
  xe-pw-167673v1: 167673v1</p>

</body>
</html>

--===============3366149084959865648==--
