Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888E2C48297
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 17:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E5610E293;
	Mon, 12 Feb 2024 17:04:23 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E454D89580;
 Mon, 12 Feb 2024 17:04:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4477381653686864598=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Prefer_struct=5Fsize_o?=
 =?utf-8?q?ver_open_coded_arithmetic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erick Archer" <erick.archer@gmx.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Feb 2024 17:04:22 -0000
Message-ID: <170775746294.1182955.5929368327694786333@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240210141913.6611-1-erick.archer@gmx.com>
In-Reply-To: <20240210141913.6611-1-erick.archer@gmx.com>
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

--===============4477381653686864598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Prefer struct_size over open coded arithmetic
URL   : https://patchwork.freedesktop.org/series/129775/
State : success

== Summary ==

CI Bug Log - changes from xe-762-46cf1a7da57fc4fd2306d52aea58a02c7eb06cce_BAT -> xe-pw-129775v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-762-46cf1a7da57fc4fd2306d52aea58a02c7eb06cce -> xe-pw-129775v1

  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-762-46cf1a7da57fc4fd2306d52aea58a02c7eb06cce: 46cf1a7da57fc4fd2306d52aea58a02c7eb06cce
  xe-pw-129775v1: 129775v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129775v1/index.html

--===============4477381653686864598==
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
<tr><td><b>Series:</b></td><td>drm/xe: Prefer struct_size over open coded arithmetic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129775/">https://patchwork.freedesktop.org/series/129775/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129775v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129775v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-762-46cf1a7da57fc4fd2306d52aea58a02c7eb06cce_BAT -&gt; xe-pw-129775v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-762-46cf1a7da57fc4fd2306d52aea58a02c7eb06cce -&gt; xe-pw-129775v1</li>
</ul>
<p>IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-762-46cf1a7da57fc4fd2306d52aea58a02c7eb06cce: 46cf1a7da57fc4fd2306d52aea58a02c7eb06cce<br />
  xe-pw-129775v1: 129775v1</p>

</body>
</html>

--===============4477381653686864598==--
