Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE4CCCF2C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 20:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADBC10E3B4;
	Fri, 16 Oct 2026 20:25:00 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0791610E39C;
 Fri, 16 Oct 2026 20:25:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3974189128642980854=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_build_with_DR?=
 =?utf-8?q?M=5FXE=3Dy_and_CONFIGFS=5FFS=3Dm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 20:25:00 -0000
Message-ID: <179218230002.36248.2463994516281901135@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016172937.2980310-2-rodrigo.vivi@intel.com>
In-Reply-To: <20261016172937.2980310-2-rodrigo.vivi@intel.com>
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

--===============3974189128642980854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m (rev2)
URL   : https://patchwork.freedesktop.org/series/176308/
State : success

== Summary ==

CI Bug Log - changes from xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89_BAT -> xe-pw-176308v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89 -> xe-pw-176308v2

  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89: 173c9ebb628f22cdfb18e080e0ef46b728649f89
  xe-pw-176308v2: 176308v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176308v2/index.html

--===============3974189128642980854==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176308/">https://patchwork.freedesktop.org/series/176308/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176308v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176308v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89_BAT -&gt; xe-pw-176308v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89 -&gt; xe-pw-176308v2</li>
</ul>
<p>IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89: 173c9ebb628f22cdfb18e080e0ef46b728649f89<br />
  xe-pw-176308v2: 176308v2</p>

</body>
</html>

--===============3974189128642980854==--
