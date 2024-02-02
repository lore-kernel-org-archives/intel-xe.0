Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF89C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA71210EC94;
	Fri,  2 Feb 2024 22:36:32 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5E410EC94;
 Fri,  2 Feb 2024 22:36:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1631171496361732058=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display=3A_Fix_memleak_in?=
 =?utf-8?q?_display_initialization_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "wangxiaoming321" <xiaoming.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 22:36:31 -0000
Message-ID: <170691339171.953329.1609618659312329839@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202215658.561298-1-lucas.demarchi@intel.com>
In-Reply-To: <20240202215658.561298-1-lucas.demarchi@intel.com>
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

--===============1631171496361732058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Fix memleak in display initialization (rev5)
URL   : https://patchwork.freedesktop.org/series/129150/
State : success

== Summary ==

CI Bug Log - changes from xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef_BAT -> xe-pw-129150v5_BAT
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

  * Linux: xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef -> xe-pw-129150v5

  IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef: 1dd92467500a5ead3e44bbdfe15e064dd79b65ef
  xe-pw-129150v5: 129150v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129150v5/index.html

--===============1631171496361732058==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Fix memleak in display initialization (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129150/">https://patchwork.freedesktop.org/series/129150/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129150v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129150v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef_BAT -&gt; xe-pw-129150v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef -&gt; xe-pw-129150v5</li>
</ul>
<p>IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef: 1dd92467500a5ead3e44bbdfe15e064dd79b65ef<br />
  xe-pw-129150v5: 129150v5</p>

</body>
</html>

--===============1631171496361732058==--
