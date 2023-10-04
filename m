Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C87E7C4E5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2D310E3A7;
	Wed,  4 Oct 2023 17:03:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D06B910E3A4;
 Wed,  4 Oct 2023 17:03:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CB964AADEA;
 Wed,  4 Oct 2023 17:03:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5593354019409386473=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 04 Oct 2023 17:03:27 -0000
Message-ID: <169643900782.7832.8239953968869188032@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231004160931.3490464-1-lucas.demarchi@intel.com>
In-Reply-To: <20231004160931.3490464-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_fixup!_dr?=
 =?utf-8?q?m/xe/hwmon=3A_Expose_power_attributes?=
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

--===============5593354019409386473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fixup! drm/xe/hwmon: Expose power attributes
URL   : https://patchwork.freedesktop.org/series/124618/
State : success

== Summary ==

CI Bug Log - changes from xe-412-ad02b0f1ea8fe562083663026a9f69a3d2ae6875_BAT -> xe-pw-124618v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-412-ad02b0f1ea8fe562083663026a9f69a3d2ae6875 -> xe-pw-124618v1

  IGT_7512: 2eb58faf82d3cd5e2e74154a7319cff56eb40762 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-412-ad02b0f1ea8fe562083663026a9f69a3d2ae6875: ad02b0f1ea8fe562083663026a9f69a3d2ae6875
  xe-pw-124618v1: 124618v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124618v1/index.html

--===============5593354019409386473==
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
<tr><td><b>Series:</b></td><td>fixup! drm/xe/hwmon: Expose power attributes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124618/">https://patchwork.freedesktop.org/series/124618/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124618v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124618v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-412-ad02b0f1ea8fe562083663026a9f69a3d2ae6875_BAT -&gt; xe-pw-124618v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-412-ad02b0f1ea8fe562083663026a9f69a3d2ae6875 -&gt; xe-pw-124618v1</li>
</ul>
<p>IGT_7512: 2eb58faf82d3cd5e2e74154a7319cff56eb40762 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-412-ad02b0f1ea8fe562083663026a9f69a3d2ae6875: ad02b0f1ea8fe562083663026a9f69a3d2ae6875<br />
  xe-pw-124618v1: 124618v1</p>

</body>
</html>

--===============5593354019409386473==--
