Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211B2C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 19:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93BC10E1BB;
	Thu, 12 Jun 2025 19:51:36 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B491410E1BB;
 Thu, 12 Jun 2025 19:51:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0443652643750965674=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/plane=3A_file_and_?=
 =?utf-8?q?function_renames_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 19:51:35 -0000
Message-ID: <174975789573.73445.13883615943962090568@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1749728173.git.jani.nikula@intel.com>
In-Reply-To: <cover.1749728173.git.jani.nikula@intel.com>
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

--===============0443652643750965674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/plane: file and function renames (rev3)
URL   : https://patchwork.freedesktop.org/series/147415/
State : success

== Summary ==

CI Bug Log - changes from xe-3242-b2fb41cb73fc88b8908b3085a2df8b81db9f460d_BAT -> xe-pw-147415v3_BAT
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

  * Linux: xe-3242-b2fb41cb73fc88b8908b3085a2df8b81db9f460d -> xe-pw-147415v3

  IGT_8407: 15d8e4978baf9879603b9556e9e8fef0888545d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3242-b2fb41cb73fc88b8908b3085a2df8b81db9f460d: b2fb41cb73fc88b8908b3085a2df8b81db9f460d
  xe-pw-147415v3: 147415v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147415v3/index.html

--===============0443652643750965674==
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
<tr><td><b>Series:</b></td><td>drm/i915/plane: file and function renames (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147415/">https://patchwork.freedesktop.org/series/147415/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147415v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147415v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3242-b2fb41cb73fc88b8908b3085a2df8b81db9f460d_BAT -&gt; xe-pw-147415v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3242-b2fb41cb73fc88b8908b3085a2df8b81db9f460d -&gt; xe-pw-147415v3</li>
</ul>
<p>IGT_8407: 15d8e4978baf9879603b9556e9e8fef0888545d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3242-b2fb41cb73fc88b8908b3085a2df8b81db9f460d: b2fb41cb73fc88b8908b3085a2df8b81db9f460d<br />
  xe-pw-147415v3: 147415v3</p>

</body>
</html>

--===============0443652643750965674==--
