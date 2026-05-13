Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3565CD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 21:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A557D10E37A;
	Wed, 13 May 2026 21:32:28 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B983210E37A;
 Wed, 13 May 2026 21:32:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6769615227620027393=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Use_xe=5Fdevi?=
 =?utf-8?q?ce=5Fis=5Fl2=5Fflush=5Foptimized=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 21:32:27 -0000
Message-ID: <177870794775.70182.3778088222041285509@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-v1-1-36fa866d6ed8@intel.com>
In-Reply-To: <20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-v1-1-36fa866d6ed8@intel.com>
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

--===============6769615227620027393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Use xe_device_is_l2_flush_optimized()
URL   : https://patchwork.freedesktop.org/series/166539/
State : success

== Summary ==

CI Bug Log - changes from xe-5059-848634197d2738329d56c588df7cd8f21c0f7568_BAT -> xe-pw-166539v1_BAT
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

  * Linux: xe-5059-848634197d2738329d56c588df7cd8f21c0f7568 -> xe-pw-166539v1

  IGT_8909: e68d82b442e3909dd053c97542aeb029707124cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5059-848634197d2738329d56c588df7cd8f21c0f7568: 848634197d2738329d56c588df7cd8f21c0f7568
  xe-pw-166539v1: 166539v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166539v1/index.html

--===============6769615227620027393==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Use xe_device_is_l2_flush_optimized()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166539/">https://patchwork.freedesktop.org/series/166539/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166539v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166539v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5059-848634197d2738329d56c588df7cd8f21c0f7568_BAT -&gt; xe-pw-166539v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5059-848634197d2738329d56c588df7cd8f21c0f7568 -&gt; xe-pw-166539v1</li>
</ul>
<p>IGT_8909: e68d82b442e3909dd053c97542aeb029707124cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5059-848634197d2738329d56c588df7cd8f21c0f7568: 848634197d2738329d56c588df7cd8f21c0f7568<br />
  xe-pw-166539v1: 166539v1</p>

</body>
</html>

--===============6769615227620027393==--
