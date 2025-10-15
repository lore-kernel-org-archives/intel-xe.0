Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70A8CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 11:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2D110E77E;
	Wed, 15 Oct 2025 11:03:29 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8636710E29A;
 Wed, 15 Oct 2025 11:03:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1495648685120897519=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Make_all_xe=5Fggt?=
 =?utf-8?q?t_structs_private=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 11:03:28 -0000
Message-ID: <176052620854.15860.3700447230173894100@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015074708.1654014-14-dev@lankhorst.se>
In-Reply-To: <20251015074708.1654014-14-dev@lankhorst.se>
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

--===============1495648685120897519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Make all xe_ggtt structs private. (rev2)
URL   : https://patchwork.freedesktop.org/series/155941/
State : success

== Summary ==

CI Bug Log - changes from xe-3923-5338aee4a6d5ef0d735cabbb3cd939ec10d0da10_BAT -> xe-pw-155941v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3923-5338aee4a6d5ef0d735cabbb3cd939ec10d0da10 -> xe-pw-155941v2

  IGT_8585: 8585
  xe-3923-5338aee4a6d5ef0d735cabbb3cd939ec10d0da10: 5338aee4a6d5ef0d735cabbb3cd939ec10d0da10
  xe-pw-155941v2: 155941v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155941v2/index.html

--===============1495648685120897519==
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
<tr><td><b>Series:</b></td><td>drm/xe: Make all xe_ggtt structs private. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155941/">https://patchwork.freedesktop.org/series/155941/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155941v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155941v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3923-5338aee4a6d5ef0d735cabbb3cd939ec10d0da10_BAT -&gt; xe-pw-155941v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3923-5338aee4a6d5ef0d735cabbb3cd939ec10d0da10 -&gt; xe-pw-155941v2</li>
</ul>
<p>IGT_8585: 8585<br />
  xe-3923-5338aee4a6d5ef0d735cabbb3cd939ec10d0da10: 5338aee4a6d5ef0d735cabbb3cd939ec10d0da10<br />
  xe-pw-155941v2: 155941v2</p>

</body>
</html>

--===============1495648685120897519==--
