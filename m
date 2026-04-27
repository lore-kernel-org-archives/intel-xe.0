Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7228AFF8860
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 16:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160FF10E037;
	Mon, 27 Apr 2026 16:52:24 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E2010E032;
 Mon, 27 Apr 2026 16:52:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5738197715949782718=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_vfio/xe=3A_avoid_duplicate_?=
 =?utf-8?q?reset_in_xe=5Fvfio=5Fpci=5Freset=5Fdone_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: zhaoguohan@kylinos.cn
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Apr 2026 16:52:22 -0000
Message-ID: <177730874266.15010.4118008286948817672@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424091719.58800-1-zhaoguohan@kylinos.cn>
In-Reply-To: <20260424091719.58800-1-zhaoguohan@kylinos.cn>
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

--===============5738197715949782718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: vfio/xe: avoid duplicate reset in xe_vfio_pci_reset_done (rev2)
URL   : https://patchwork.freedesktop.org/series/165429/
State : success

== Summary ==

CI Bug Log - changes from xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b_BAT -> xe-pw-165429v2_BAT
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

  * Linux: xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b -> xe-pw-165429v2

  IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b: fce38e768e144d1935086ce9fb66da3a9907029b
  xe-pw-165429v2: 165429v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/index.html

--===============5738197715949782718==
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
<tr><td><b>Series:</b></td><td>vfio/xe: avoid duplicate reset in xe_vfio_pci_reset_done (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165429/">https://patchwork.freedesktop.org/series/165429/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b_BAT -&gt; xe-pw-165429v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b -&gt; xe-pw-165429v2</li>
</ul>
<p>IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b: fce38e768e144d1935086ce9fb66da3a9907029b<br />
  xe-pw-165429v2: 165429v2</p>

</body>
</html>

--===============5738197715949782718==--
