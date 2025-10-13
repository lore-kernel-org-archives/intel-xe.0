Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557F6CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 22:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A2510E503;
	Mon, 13 Oct 2025 22:14:07 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4165C10E503;
 Mon, 13 Oct 2025 22:14:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0579296044303208833=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Retain_vma_flags_?=
 =?utf-8?q?when_recreating_and_splitting_vmas_for_madvise?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Oct 2025 22:14:07 -0000
Message-ID: <176039364725.7451.12729601519661703764@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013185348.88033-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251013185348.88033-1-thomas.hellstrom@linux.intel.com>
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

--===============0579296044303208833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Retain vma flags when recreating and splitting vmas for madvise
URL   : https://patchwork.freedesktop.org/series/155852/
State : success

== Summary ==

CI Bug Log - changes from xe-3910-f33ccc63d84c30ee59454b6c4e9303ef36c41c0c_BAT -> xe-pw-155852v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3910-f33ccc63d84c30ee59454b6c4e9303ef36c41c0c -> xe-pw-155852v1

  IGT_8582: 8582
  xe-3910-f33ccc63d84c30ee59454b6c4e9303ef36c41c0c: f33ccc63d84c30ee59454b6c4e9303ef36c41c0c
  xe-pw-155852v1: 155852v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155852v1/index.html

--===============0579296044303208833==
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
<tr><td><b>Series:</b></td><td>drm/xe: Retain vma flags when recreating and splitting vmas for madvise</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155852/">https://patchwork.freedesktop.org/series/155852/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155852v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155852v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3910-f33ccc63d84c30ee59454b6c4e9303ef36c41c0c_BAT -&gt; xe-pw-155852v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3910-f33ccc63d84c30ee59454b6c4e9303ef36c41c0c -&gt; xe-pw-155852v1</li>
</ul>
<p>IGT_8582: 8582<br />
  xe-3910-f33ccc63d84c30ee59454b6c4e9303ef36c41c0c: f33ccc63d84c30ee59454b6c4e9303ef36c41c0c<br />
  xe-pw-155852v1: 155852v1</p>

</body>
</html>

--===============0579296044303208833==--
