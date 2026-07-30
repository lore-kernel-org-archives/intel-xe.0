Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94773C55160
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 12:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0AB10EEB6;
	Thu, 30 Jul 2026 12:45:41 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75D810EEB6;
 Thu, 30 Jul 2026 12:45:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3963109879930869372=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_CMRR_in_fixed-RR_VRR?=
 =?utf-8?q?_path_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 12:45:40 -0000
Message-ID: <178541554067.5178.2365951891559666744@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============3963109879930869372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable CMRR in fixed-RR VRR path (rev8)
URL   : https://patchwork.freedesktop.org/series/168613/
State : success

== Summary ==

CI Bug Log - changes from xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd_BAT -> xe-pw-168613v8_BAT
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

  * Linux: xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd -> xe-pw-168613v8

  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd: 5e24f68d311764bf343f9def49b752b509dfd5fd
  xe-pw-168613v8: 168613v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/index.html

--===============3963109879930869372==
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
<tr><td><b>Series:</b></td><td>Enable CMRR in fixed-RR VRR path (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168613/">https://patchwork.freedesktop.org/series/168613/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd_BAT -&gt; xe-pw-168613v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd -&gt; xe-pw-168613v8</li>
</ul>
<p>IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd: 5e24f68d311764bf343f9def49b752b509dfd5fd<br />
  xe-pw-168613v8: 168613v8</p>

</body>
</html>

--===============3963109879930869372==--
