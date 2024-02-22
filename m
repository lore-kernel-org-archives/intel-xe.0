Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3D5C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 19:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F7F10EA34;
	Thu, 22 Feb 2024 19:07:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D398010EA34;
 Thu, 22 Feb 2024 19:07:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5254549317176035501=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915=3A_Add_missing_=3B_to_?=
 =?utf-8?q?=5F=5Fassign=5Fstr=28=29_macros_in_tracepoint_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Steven Rostedt" <rostedt@goodmis.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 19:07:18 -0000
Message-ID: <170862883886.217031.14387019060677919024@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222133057.2af72a19@gandalf.local.home>
In-Reply-To: <20240222133057.2af72a19@gandalf.local.home>
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

--===============5254549317176035501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Add missing ; to __assign_str() macros in tracepoint code
URL   : https://patchwork.freedesktop.org/series/130277/
State : success

== Summary ==

CI Bug Log - changes from xe-828-8937e9920fbbab4e5706f366920e9a438d45b07a_BAT -> xe-pw-130277v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-828-8937e9920fbbab4e5706f366920e9a438d45b07a -> xe-pw-130277v1

  IGT_7724: a7c03f7521f88f74fdf17c744fd847a775f9951f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-828-8937e9920fbbab4e5706f366920e9a438d45b07a: 8937e9920fbbab4e5706f366920e9a438d45b07a
  xe-pw-130277v1: 130277v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130277v1/index.html

--===============5254549317176035501==
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
<tr><td><b>Series:</b></td><td>drm/i915: Add missing ; to __assign_str() macros in tracepoint code</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130277/">https://patchwork.freedesktop.org/series/130277/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130277v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130277v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-828-8937e9920fbbab4e5706f366920e9a438d45b07a_BAT -&gt; xe-pw-130277v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-828-8937e9920fbbab4e5706f366920e9a438d45b07a -&gt; xe-pw-130277v1</li>
</ul>
<p>IGT_7724: a7c03f7521f88f74fdf17c744fd847a775f9951f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-828-8937e9920fbbab4e5706f366920e9a438d45b07a: 8937e9920fbbab4e5706f366920e9a438d45b07a<br />
  xe-pw-130277v1: 130277v1</p>

</body>
</html>

--===============5254549317176035501==--
