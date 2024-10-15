Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE70D1F9C6
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 20:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785B410E604;
	Tue, 15 Oct 2024 20:14:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB62C10E604;
 Tue, 15 Oct 2024 20:14:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8153016584868021637=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_enable_lite_restore_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Oct 2024 20:14:31 -0000
Message-ID: <172902327182.1270601.10442247979965097007@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010173142.425498-1-fei.yang@intel.com>
In-Reply-To: <20241010173142.425498-1-fei.yang@intel.com>
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

--===============8153016584868021637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: enable lite restore (rev4)
URL   : https://patchwork.freedesktop.org/series/139734/
State : success

== Summary ==

CI Bug Log - changes from xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823_BAT -> xe-pw-139734v4_BAT
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

  * IGT: IGT_8073 -> IGT_8074
  * Linux: xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823 -> xe-pw-139734v4

  IGT_8073: afc7d63f0733598ecf3d3b48a2edd23bf7609a09 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8074: a886e0ad97832dc2ba9b85d35bca22e667c15105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823: 01c7b2c084e5c84313f382734c10945b9aa49823
  xe-pw-139734v4: 139734v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v4/index.html

--===============8153016584868021637==
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
<tr><td><b>Series:</b></td><td>drm/xe: enable lite restore (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139734/">https://patchwork.freedesktop.org/series/139734/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823_BAT -&gt; xe-pw-139734v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8073 -&gt; IGT_8074</li>
<li>Linux: xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823 -&gt; xe-pw-139734v4</li>
</ul>
<p>IGT_8073: afc7d63f0733598ecf3d3b48a2edd23bf7609a09 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8074: a886e0ad97832dc2ba9b85d35bca22e667c15105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823: 01c7b2c084e5c84313f382734c10945b9aa49823<br />
  xe-pw-139734v4: 139734v4</p>

</body>
</html>

--===============8153016584868021637==--
