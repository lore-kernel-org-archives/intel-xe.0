Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE83BC47DB7
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 09:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7044110E981;
	Fri, 19 Jan 2024 09:03:07 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2833310E98E;
 Fri, 19 Jan 2024 09:03:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0924274391504181678=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/debugfs=3A_Expose_debugfs?=
 =?utf-8?q?_entry_to_check_guc_pc_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Date: Fri, 19 Jan 2024 09:03:06 -0000
Message-ID: <170565498616.558567.704523191242940889@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119081852.1858212-1-badal.nilawar@intel.com>
In-Reply-To: <20240119081852.1858212-1-badal.nilawar@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0924274391504181678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/debugfs: Expose debugfs entry to check guc pc support
URL   : https://patchwork.freedesktop.org/series/128970/
State : success

== Summary ==

CI Bug Log - changes from xe-651-3a46543b6e3ca856486ba5d06e5ba0af865ff357_BAT -> xe-pw-128970v1_BAT
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

  * Linux: xe-651-3a46543b6e3ca856486ba5d06e5ba0af865ff357 -> xe-pw-128970v1

  IGT_7683: 7683
  xe-651-3a46543b6e3ca856486ba5d06e5ba0af865ff357: 3a46543b6e3ca856486ba5d06e5ba0af865ff357
  xe-pw-128970v1: 128970v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128970v1/index.html

--===============0924274391504181678==
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
<tr><td><b>Series:</b></td><td>drm/xe/debugfs: Expose debugfs entry to check guc pc support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128970/">https://patchwork.freedesktop.org/series/128970/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128970v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128970v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-651-3a46543b6e3ca856486ba5d06e5ba0af865ff357_BAT -&gt; xe-pw-128970v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-651-3a46543b6e3ca856486ba5d06e5ba0af865ff357 -&gt; xe-pw-128970v1</li>
</ul>
<p>IGT_7683: 7683<br />
  xe-651-3a46543b6e3ca856486ba5d06e5ba0af865ff357: 3a46543b6e3ca856486ba5d06e5ba0af865ff357<br />
  xe-pw-128970v1: 128970v1</p>

</body>
</html>

--===============0924274391504181678==--
