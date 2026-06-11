Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09196CD98C6
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 06:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8F510ED09;
	Thu, 11 Jun 2026 06:20:44 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B60F10ECF1;
 Thu, 11 Jun 2026 06:20:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3461495249195108091=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_drm=5Fras_netlink_error?=
 =?utf-8?q?_event_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 06:20:43 -0000
Message-ID: <178115884363.67758.17153753119393972122@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611052144.784969-4-riana.tauro@intel.com>
In-Reply-To: <20260611052144.784969-4-riana.tauro@intel.com>
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

--===============3461495249195108091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add drm_ras netlink error event support (rev2)
URL   : https://patchwork.freedesktop.org/series/166765/
State : success

== Summary ==

CI Bug Log - changes from xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5_BAT -> xe-pw-166765v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-wcl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5 -> xe-pw-166765v2

  IGT_8958: 8958
  xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5: b50be9fd86832954f116a099ffbe4ad107df16a5
  xe-pw-166765v2: 166765v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v2/index.html

--===============3461495249195108091==
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
<tr><td><b>Series:</b></td><td>Add drm_ras netlink error event support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166765/">https://patchwork.freedesktop.org/series/166765/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5_BAT -&gt; xe-pw-166765v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-wcl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5 -&gt; xe-pw-166765v2</li>
</ul>
<p>IGT_8958: 8958<br />
  xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5: b50be9fd86832954f116a099ffbe4ad107df16a5<br />
  xe-pw-166765v2: 166765v2</p>

</body>
</html>

--===============3461495249195108091==--
