Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7652CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 14:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987AF10E9C6;
	Wed, 10 Jun 2026 14:23:12 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C67110E9C6;
 Wed, 10 Jun 2026 14:23:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0295046777720982272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5BRFC?=
 =?utf-8?q?=2C1/2=5D_drm/gpusvm=3A_Add_a_DMA-mapping_accounting_callback?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jun 2026 14:23:11 -0000
Message-ID: <178110139150.64488.2328879504244374577@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610133451.8930-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260610133451.8930-1-thomas.hellstrom@linux.intel.com>
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

--===============0295046777720982272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [RFC,1/2] drm/gpusvm: Add a DMA-mapping accounting callback
URL   : https://patchwork.freedesktop.org/series/168247/
State : success

== Summary ==

CI Bug Log - changes from xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a_BAT -> xe-pw-168247v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-lnl-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a -> xe-pw-168247v1

  IGT_8956: 8956
  xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a: 724e06af260b571e2d970d4a806ae3d620ff0b7a
  xe-pw-168247v1: 168247v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168247v1/index.html

--===============0295046777720982272==
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
<tr><td><b>Series:</b></td><td>series starting with [RFC,1/2] drm/gpusvm: Add a DMA-mapping accounting callback</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168247/">https://patchwork.freedesktop.org/series/168247/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168247v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168247v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a_BAT -&gt; xe-pw-168247v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-lnl-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a -&gt; xe-pw-168247v1</li>
</ul>
<p>IGT_8956: 8956<br />
  xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a: 724e06af260b571e2d970d4a806ae3d620ff0b7a<br />
  xe-pw-168247v1: 168247v1</p>

</body>
</html>

--===============0295046777720982272==--
