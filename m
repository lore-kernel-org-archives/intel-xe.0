Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA1DC52D6F
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 14:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA2410E2B4;
	Mon, 19 Aug 2024 14:55:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7EF10E2B3;
 Mon, 19 Aug 2024 14:55:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1863640576796947963=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/oa=3A_Use_vma=5Fpages=28?=
 =?utf-8?q?=29_helper_function_in_xe=5Foa=5Fmmap=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thorsten Blum" <thorsten.blum@toblux.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Aug 2024 14:55:37 -0000
Message-ID: <172407933760.694772.10359388060739476978@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240819095751.539645-2-thorsten.blum@toblux.com>
In-Reply-To: <20240819095751.539645-2-thorsten.blum@toblux.com>
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

--===============1863640576796947963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/oa: Use vma_pages() helper function in xe_oa_mmap() (rev2)
URL   : https://patchwork.freedesktop.org/series/136514/
State : success

== Summary ==

CI Bug Log - changes from xe-1792-997f91bcdf1249b248ff040e89472779e3d8488b_BAT -> xe-pw-136514v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1792-997f91bcdf1249b248ff040e89472779e3d8488b -> xe-pw-136514v2

  IGT_7975: 7975
  xe-1792-997f91bcdf1249b248ff040e89472779e3d8488b: 997f91bcdf1249b248ff040e89472779e3d8488b
  xe-pw-136514v2: 136514v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136514v2/index.html

--===============1863640576796947963==
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
<tr><td><b>Series:</b></td><td>drm/xe/oa: Use vma_pages() helper function in xe_oa_mmap() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136514/">https://patchwork.freedesktop.org/series/136514/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136514v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136514v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1792-997f91bcdf1249b248ff040e89472779e3d8488b_BAT -&gt; xe-pw-136514v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1792-997f91bcdf1249b248ff040e89472779e3d8488b -&gt; xe-pw-136514v2</li>
</ul>
<p>IGT_7975: 7975<br />
  xe-1792-997f91bcdf1249b248ff040e89472779e3d8488b: 997f91bcdf1249b248ff040e89472779e3d8488b<br />
  xe-pw-136514v2: 136514v2</p>

</body>
</html>

--===============1863640576796947963==--
