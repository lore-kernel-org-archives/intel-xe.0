Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0D6C369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 13:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AE810E5D1;
	Mon, 14 Apr 2025 13:30:31 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DEE10E5D0;
 Mon, 14 Apr 2025 13:30:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6798470991967846350=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_error_capture_c?=
 =?utf-8?q?leanups_and_refactor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 13:30:29 -0000
Message-ID: <174463742941.1842.1716611329453544445@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <cover.1744630147.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744630147.git.jani.nikula@intel.com>
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

--===============6798470991967846350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: error capture cleanups and refactor
URL   : https://patchwork.freedesktop.org/series/147673/
State : success

== Summary ==

CI Bug Log - changes from xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa_BAT -> xe-pw-147673v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8317 -> IGT_8318
  * Linux: xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa -> xe-pw-147673v1

  IGT_8317: 8317
  IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa: 7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa
  xe-pw-147673v1: 147673v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147673v1/index.html

--===============6798470991967846350==
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
<tr><td><b>Series:</b></td><td>drm/i915: error capture cleanups and refactor</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147673/">https://patchwork.freedesktop.org/series/147673/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147673v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147673v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa_BAT -&gt; xe-pw-147673v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8317 -&gt; IGT_8318</li>
<li>Linux: xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa -&gt; xe-pw-147673v1</li>
</ul>
<p>IGT_8317: 8317<br />
  IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa: 7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa<br />
  xe-pw-147673v1: 147673v1</p>

</body>
</html>

--===============6798470991967846350==--
