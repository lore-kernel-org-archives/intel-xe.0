Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E518CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 15:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F8910E2D6;
	Tue, 19 Aug 2025 15:37:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0D010E2D6;
 Tue, 19 Aug 2025 15:37:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3985000916239684750=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Make_struct_xe=5F?=
 =?utf-8?q?ggtt_private=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Aug 2025 15:37:02 -0000
Message-ID: <175561782230.247874.12929758685204056550@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250819101119.511705-8-dev@lankhorst.se>
In-Reply-To: <20250819101119.511705-8-dev@lankhorst.se>
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

--===============3985000916239684750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Make struct xe_ggtt private. (rev3)
URL   : https://patchwork.freedesktop.org/series/139778/
State : success

== Summary ==

CI Bug Log - changes from xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa_BAT -> xe-pw-139778v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8497 -> IGT_8498
  * Linux: xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa -> xe-pw-139778v3

  IGT_8497: 8497
  IGT_8498: 8498
  xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa: deb6c5d08f8b84ea7e019b7682631c6375cc17aa
  xe-pw-139778v3: 139778v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139778v3/index.html

--===============3985000916239684750==
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
<tr><td><b>Series:</b></td><td>drm/xe: Make struct xe_ggtt private. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139778/">https://patchwork.freedesktop.org/series/139778/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139778v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139778v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa_BAT -&gt; xe-pw-139778v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8497 -&gt; IGT_8498</li>
<li>Linux: xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa -&gt; xe-pw-139778v3</li>
</ul>
<p>IGT_8497: 8497<br />
  IGT_8498: 8498<br />
  xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa: deb6c5d08f8b84ea7e019b7682631c6375cc17aa<br />
  xe-pw-139778v3: 139778v3</p>

</body>
</html>

--===============3985000916239684750==--
