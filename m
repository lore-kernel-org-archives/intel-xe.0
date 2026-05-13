Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF793CD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 08:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F86E10E27E;
	Wed, 13 May 2026 08:14:46 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2485D89B12;
 Wed, 13 May 2026 08:14:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5959164964098665662=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_helper_to_det?=
 =?utf-8?q?ect_real_vs_kunit_xe=5Fdevice?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 08:14:46 -0000
Message-ID: <177866008612.66452.3742818559625894518@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512194514.3414-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260512194514.3414-1-michal.wajdeczko@intel.com>
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

--===============5959164964098665662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add helper to detect real vs kunit xe_device
URL   : https://patchwork.freedesktop.org/series/166452/
State : success

== Summary ==

CI Bug Log - changes from xe-5053-8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4_BAT -> xe-pw-166452v1_BAT
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

  * IGT: IGT_8907 -> IGT_8909
  * Linux: xe-5053-8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4 -> xe-pw-166452v1

  IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8909: e68d82b442e3909dd053c97542aeb029707124cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5053-8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4: 8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4
  xe-pw-166452v1: 166452v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166452v1/index.html

--===============5959164964098665662==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add helper to detect real vs kunit xe_device</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166452/">https://patchwork.freedesktop.org/series/166452/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166452v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166452v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5053-8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4_BAT -&gt; xe-pw-166452v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8907 -&gt; IGT_8909</li>
<li>Linux: xe-5053-8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4 -&gt; xe-pw-166452v1</li>
</ul>
<p>IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8909: e68d82b442e3909dd053c97542aeb029707124cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5053-8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4: 8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4<br />
  xe-pw-166452v1: 166452v1</p>

</body>
</html>

--===============5959164964098665662==--
