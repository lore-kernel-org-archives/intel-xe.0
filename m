Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA66CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 07:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6020510E674;
	Wed,  1 Oct 2025 07:25:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F86110E33C;
 Wed,  1 Oct 2025 07:25:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5289225314468269604=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/1?=
 =?utf-8?q?=5D_drm/xe/eustall=3A_Return_EBADFD_from_read_if_EU_stall_registe?=
 =?utf-8?q?rs_get_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Oct 2025 07:25:16 -0000
Message-ID: <175930351611.381728.5857841697301974964@1538d3639d33>
X-Patchwork-Hint: ignore
References: <1ce99022596f054b0b248f5a9c5ece7c1084febb.1759300369.git.harish.chegondi@intel.com>
In-Reply-To: <1ce99022596f054b0b248f5a9c5ece7c1084febb.1759300369.git.harish.chegondi@intel.com>
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

--===============5289225314468269604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe/eustall: Return EBADFD from read if EU stall registers get reset
URL   : https://patchwork.freedesktop.org/series/155271/
State : success

== Summary ==

CI Bug Log - changes from xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947_BAT -> xe-pw-155271v1_BAT
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

  * IGT: IGT_8564 -> IGT_8565
  * Linux: xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947 -> xe-pw-155271v1

  IGT_8564: fd0f7b3639b26971567b7a9d64ba5174d5d3db5a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8565: 8565
  xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947: 23f8be57505c80e5b57dec249df8a3cc053eb947
  xe-pw-155271v1: 155271v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155271v1/index.html

--===============5289225314468269604==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe/eustall: Return EBADFD from read if EU stall registers get reset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155271/">https://patchwork.freedesktop.org/series/155271/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155271v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155271v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947_BAT -&gt; xe-pw-155271v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8564 -&gt; IGT_8565</li>
<li>Linux: xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947 -&gt; xe-pw-155271v1</li>
</ul>
<p>IGT_8564: fd0f7b3639b26971567b7a9d64ba5174d5d3db5a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8565: 8565<br />
  xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947: 23f8be57505c80e5b57dec249df8a3cc053eb947<br />
  xe-pw-155271v1: 155271v1</p>

</body>
</html>

--===============5289225314468269604==--
