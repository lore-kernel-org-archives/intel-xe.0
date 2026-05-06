Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C01CD3439
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 19:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4559B10EE94;
	Wed,  6 May 2026 19:59:42 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1271D10EE95;
 Wed,  6 May 2026 19:59:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6475357411216622866=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/dma-buf=3A_handle_em?=
 =?utf-8?q?pty_bo_and_UAF_races?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 May 2026 19:59:41 -0000
Message-ID: <177809758106.44926.17547499489600282468@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260506184332.86743-2-matthew.auld@intel.com>
In-Reply-To: <20260506184332.86743-2-matthew.auld@intel.com>
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

--===============6475357411216622866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/dma-buf: handle empty bo and UAF races
URL   : https://patchwork.freedesktop.org/series/166074/
State : success

== Summary ==

CI Bug Log - changes from xe-5005-8fbe29a5c889ea210aa55f3ee9a4b753290ad4b1_BAT -> xe-pw-166074v1_BAT
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

  * Linux: xe-5005-8fbe29a5c889ea210aa55f3ee9a4b753290ad4b1 -> xe-pw-166074v1

  IGT_8894: 044f2c8744a52317c4651b4ca9d3b12f5be51575 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5005-8fbe29a5c889ea210aa55f3ee9a4b753290ad4b1: 8fbe29a5c889ea210aa55f3ee9a4b753290ad4b1
  xe-pw-166074v1: 166074v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166074v1/index.html

--===============6475357411216622866==
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
<tr><td><b>Series:</b></td><td>drm/xe/dma-buf: handle empty bo and UAF races</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166074/">https://patchwork.freedesktop.org/series/166074/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166074v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166074v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5005-8fbe29a5c889ea210aa55f3ee9a4b753290ad4b1_BAT -&gt; xe-pw-166074v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5005-8fbe29a5c889ea210aa55f3ee9a4b753290ad4b1 -&gt; xe-pw-166074v1</li>
</ul>
<p>IGT_8894: 044f2c8744a52317c4651b4ca9d3b12f5be51575 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5005-8fbe29a5c889ea210aa55f3ee9a4b753290ad4b1: 8fbe29a5c889ea210aa55f3ee9a4b753290ad4b1<br />
  xe-pw-166074v1: 166074v1</p>

</body>
</html>

--===============6475357411216622866==--
