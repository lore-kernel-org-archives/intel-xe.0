Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A58DC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 19:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051D710E0A4;
	Wed, 28 May 2025 19:56:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B5A10E0A4;
 Wed, 28 May 2025 19:56:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7640073557756467161=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_Rework_eviction_?=
 =?utf-8?q?rejection_of_bound_external_bos_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 19:56:23 -0000
Message-ID: <174846218302.29549.7220311425302814803@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528164105.234718-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250528164105.234718-1-thomas.hellstrom@linux.intel.com>
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

--===============7640073557756467161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rework eviction rejection of bound external bos (rev3)
URL   : https://patchwork.freedesktop.org/series/149505/
State : success

== Summary ==

CI Bug Log - changes from xe-3152-9c6f1615c9a1f0d3ec6c8d3af535bf7773d68ecf_FULL -> xe-pw-149505v3_FULL
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

  * Linux: xe-3152-9c6f1615c9a1f0d3ec6c8d3af535bf7773d68ecf -> xe-pw-149505v3

  IGT_8381: 8381
  xe-3152-9c6f1615c9a1f0d3ec6c8d3af535bf7773d68ecf: 9c6f1615c9a1f0d3ec6c8d3af535bf7773d68ecf
  xe-pw-149505v3: 149505v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149505v3/index.html

--===============7640073557756467161==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rework eviction rejection of bound external bos (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149505/">https://patchwork.freedesktop.org/series/149505/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149505v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149505v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3152-9c6f1615c9a1f0d3ec6c8d3af535bf7773d68ecf_FULL -&gt; xe-pw-149505v3_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3152-9c6f1615c9a1f0d3ec6c8d3af535bf7773d68ecf -&gt; xe-pw-149505v3</li>
</ul>
<p>IGT_8381: 8381<br />
  xe-3152-9c6f1615c9a1f0d3ec6c8d3af535bf7773d68ecf: 9c6f1615c9a1f0d3ec6c8d3af535bf7773d68ecf<br />
  xe-pw-149505v3: 149505v3</p>

</body>
</html>

--===============7640073557756467161==--
