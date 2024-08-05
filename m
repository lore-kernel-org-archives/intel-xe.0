Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E50C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 21:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1707389870;
	Mon,  5 Aug 2024 21:35:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD61789870;
 Mon,  5 Aug 2024 21:35:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1166033949298542823=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Enable_w/a_1402229?=
 =?utf-8?q?3748_and_22019794406_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 21:35:40 -0000
Message-ID: <172289374090.541758.10447784251817514571@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805205435.921921-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240805205435.921921-1-daniele.ceraolospurio@intel.com>
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

--===============1166033949298542823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Enable w/a 14022293748 and 22019794406 (rev5)
URL   : https://patchwork.freedesktop.org/series/136307/
State : success

== Summary ==

CI Bug Log - changes from xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de_BAT -> xe-pw-136307v5_BAT
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

  * Linux: xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de -> xe-pw-136307v5

  IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de: 23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de
  xe-pw-136307v5: 136307v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136307v5/index.html

--===============1166033949298542823==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Enable w/a 14022293748 and 22019794406 (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136307/">https://patchwork.freedesktop.org/series/136307/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136307v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136307v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de_BAT -&gt; xe-pw-136307v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de -&gt; xe-pw-136307v5</li>
</ul>
<p>IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de: 23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de<br />
  xe-pw-136307v5: 136307v5</p>

</body>
</html>

--===============1166033949298542823==--
