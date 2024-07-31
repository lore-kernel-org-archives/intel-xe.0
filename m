Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CB7C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 13:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AEF10E25D;
	Wed, 31 Jul 2024 13:05:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B97789444;
 Wed, 31 Jul 2024 13:05:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3625336135309771813=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm=3A_Use_backlight_power_const?=
 =?utf-8?q?ants?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 13:05:40 -0000
Message-ID: <172243114010.467840.5368100833873371758@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731122311.1143153-1-tzimmermann@suse.de>
In-Reply-To: <20240731122311.1143153-1-tzimmermann@suse.de>
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

--===============3625336135309771813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: Use backlight power constants
URL   : https://patchwork.freedesktop.org/series/136738/
State : success

== Summary ==

CI Bug Log - changes from xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338_BAT -> xe-pw-136738v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7944 -> IGT_7945
  * Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -> xe-pw-136738v1

  IGT_7944: 7944
  IGT_7945: 7945
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338
  xe-pw-136738v1: 136738v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/index.html

--===============3625336135309771813==
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
<tr><td><b>Series:</b></td><td>drm: Use backlight power constants</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136738/">https://patchwork.freedesktop.org/series/136738/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136738v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338_BAT -&gt; xe-pw-136738v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7944 -&gt; IGT_7945</li>
<li>Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -&gt; xe-pw-136738v1</li>
</ul>
<p>IGT_7944: 7944<br />
  IGT_7945: 7945<br />
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338<br />
  xe-pw-136738v1: 136738v1</p>

</body>
</html>

--===============3625336135309771813==--
