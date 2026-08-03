Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0F2C55182
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 13:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663EB10E612;
	Mon,  3 Aug 2026 13:51:17 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC70810E5E5;
 Mon,  3 Aug 2026 13:51:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3326602208735118902=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/tests/gpu=5Fbuddy=3A_f?=
 =?utf-8?q?ix_interleaving_in_buffer_clearance_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Aug 2026 13:51:16 -0000
Message-ID: <178576507682.13593.895345749340959510@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803065656.2960810-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260803065656.2960810-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============3326602208735118902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/tests/gpu_buddy: fix interleaving in buffer clearance test (rev2)
URL   : https://patchwork.freedesktop.org/series/170880/
State : success

== Summary ==

CI Bug Log - changes from xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39_FULL -> xe-pw-170880v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (0 -> 0)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39 -> xe-pw-170880v2

  IGT_9036: 9036
  xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39: 602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39
  xe-pw-170880v2: 170880v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170880v2/index.html

--===============3326602208735118902==
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
<tr><td><b>Series:</b></td><td>drm/tests/gpu_buddy: fix interleaving in buffer clearance test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170880/">https://patchwork.freedesktop.org/series/170880/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170880v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170880v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39_FULL -&gt; xe-pw-170880v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (0 -&gt; 0)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39 -&gt; xe-pw-170880v2</li>
</ul>
<p>IGT_9036: 9036<br />
  xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39: 602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39<br />
  xe-pw-170880v2: 170880v2</p>

</body>
</html>

--===============3326602208735118902==--
