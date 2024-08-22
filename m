Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1399BC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 12:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D506110E871;
	Thu, 22 Aug 2024 12:13:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342A710E871;
 Thu, 22 Aug 2024 12:13:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7110028350526841942=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_move_the_kernel_lrc_fr?=
 =?utf-8?q?om_hwe_to_execlist_port?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Aug 2024 12:13:42 -0000
Message-ID: <172432882220.724138.12234424677513821633@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240822110252.1280706-1-ilia.levi@intel.com>
In-Reply-To: <20240822110252.1280706-1-ilia.levi@intel.com>
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

--===============7110028350526841942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: move the kernel lrc from hwe to execlist port
URL   : https://patchwork.freedesktop.org/series/137638/
State : success

== Summary ==

CI Bug Log - changes from xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8_BAT -> xe-pw-137638v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8 -> xe-pw-137638v1

  IGT_7983: b2e17acf37471073210221724a66d164328dee98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8: 6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8
  xe-pw-137638v1: 137638v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137638v1/index.html

--===============7110028350526841942==
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
<tr><td><b>Series:</b></td><td>drm/xe: move the kernel lrc from hwe to execlist port</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137638/">https://patchwork.freedesktop.org/series/137638/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137638v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137638v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8_BAT -&gt; xe-pw-137638v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8 -&gt; xe-pw-137638v1</li>
</ul>
<p>IGT_7983: b2e17acf37471073210221724a66d164328dee98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8: 6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8<br />
  xe-pw-137638v1: 137638v1</p>

</body>
</html>

--===============7110028350526841942==--
