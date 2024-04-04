Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED317CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 09:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E0E11B023;
	Thu,  4 Apr 2024 09:49:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852D811AFFD;
 Thu,  4 Apr 2024 09:49:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1529567868863096377=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_bo_leak_in_intel?=
 =?utf-8?q?=5Ffb=5Fbo=5Fframebuffer=5Finit_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Apr 2024 09:49:31 -0000
Message-ID: <171222417154.1209409.6848327052793695712@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404090302.68422-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240404090302.68422-1-maarten.lankhorst@linux.intel.com>
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

--===============1529567868863096377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init (rev3)
URL   : https://patchwork.freedesktop.org/series/131429/
State : success

== Summary ==

CI Bug Log - changes from xe-1033-406e10d886a22211d2866bfa9322aec1727171f8_BAT -> xe-pw-131429v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7797 -> IGT_7798
  * Linux: xe-1033-406e10d886a22211d2866bfa9322aec1727171f8 -> xe-pw-131429v3

  IGT_7797: e88ebc17ec12b503aab380b08c1213af9cc7a97c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7798: 5e3263748a636ebc91ecfafbd339870c77e3eed6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1033-406e10d886a22211d2866bfa9322aec1727171f8: 406e10d886a22211d2866bfa9322aec1727171f8
  xe-pw-131429v3: 131429v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131429v3/index.html

--===============1529567868863096377==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131429/">https://patchwork.freedesktop.org/series/131429/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131429v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131429v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1033-406e10d886a22211d2866bfa9322aec1727171f8_BAT -&gt; xe-pw-131429v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7797 -&gt; IGT_7798</li>
<li>Linux: xe-1033-406e10d886a22211d2866bfa9322aec1727171f8 -&gt; xe-pw-131429v3</li>
</ul>
<p>IGT_7797: e88ebc17ec12b503aab380b08c1213af9cc7a97c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7798: 5e3263748a636ebc91ecfafbd339870c77e3eed6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1033-406e10d886a22211d2866bfa9322aec1727171f8: 406e10d886a22211d2866bfa9322aec1727171f8<br />
  xe-pw-131429v3: 131429v3</p>

</body>
</html>

--===============1529567868863096377==--
