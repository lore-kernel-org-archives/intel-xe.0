Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3124CCAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 15:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BAA10E09F;
	Wed,  1 Oct 2025 15:35:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F2B10E45B;
 Wed,  1 Oct 2025 15:35:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0895198176154811925=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/client=3A_Remove_holds?=
 =?utf-8?q?=5Fconsole=5Flock_parameter_from_suspend/resume_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Oct 2025 15:35:49 -0000
Message-ID: <175933294985.384040.5732122740208092262@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20251001143709.419736-1-tzimmermann@suse.de>
In-Reply-To: <20251001143709.419736-1-tzimmermann@suse.de>
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

--===============0895198176154811925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/client: Remove holds_console_lock parameter from suspend/resume (rev2)
URL   : https://patchwork.freedesktop.org/series/155286/
State : success

== Summary ==

CI Bug Log - changes from xe-3852-bb42887c28cd6ede2c83547a9afc852a6aed3569_BAT -> xe-pw-155286v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8565 -> IGT_8568
  * Linux: xe-3852-bb42887c28cd6ede2c83547a9afc852a6aed3569 -> xe-pw-155286v2

  IGT_8565: 8565
  IGT_8568: 8568
  xe-3852-bb42887c28cd6ede2c83547a9afc852a6aed3569: bb42887c28cd6ede2c83547a9afc852a6aed3569
  xe-pw-155286v2: 155286v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155286v2/index.html

--===============0895198176154811925==
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
<tr><td><b>Series:</b></td><td>drm/client: Remove holds_console_lock parameter from suspend/resume (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155286/">https://patchwork.freedesktop.org/series/155286/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155286v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155286v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3852-bb42887c28cd6ede2c83547a9afc852a6aed3569_BAT -&gt; xe-pw-155286v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8565 -&gt; IGT_8568</li>
<li>Linux: xe-3852-bb42887c28cd6ede2c83547a9afc852a6aed3569 -&gt; xe-pw-155286v2</li>
</ul>
<p>IGT_8565: 8565<br />
  IGT_8568: 8568<br />
  xe-3852-bb42887c28cd6ede2c83547a9afc852a6aed3569: bb42887c28cd6ede2c83547a9afc852a6aed3569<br />
  xe-pw-155286v2: 155286v2</p>

</body>
</html>

--===============0895198176154811925==--
