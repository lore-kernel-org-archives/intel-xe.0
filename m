Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691B9C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 16:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C1510E254;
	Wed,  5 Jun 2024 16:26:10 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693ED10E254;
 Wed,  5 Jun 2024 16:26:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2591659953359529109=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe=5Fgt=5Fdebugfs=3A_Add_?=
 =?utf-8?q?synchronous_gt_reset_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 16:26:09 -0000
Message-ID: <171760476942.2161.4907792394118386614@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
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

--===============2591659953359529109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
URL   : https://patchwork.freedesktop.org/series/134508/
State : success

== Summary ==

CI Bug Log - changes from xe-1405-a494545483635d3d93d19e8f483f61e7d4198383_BAT -> xe-pw-134508v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7878 -> IGT_7879
  * Linux: xe-1405-a494545483635d3d93d19e8f483f61e7d4198383 -> xe-pw-134508v1

  IGT_7878: eecd5683bd98cee3fc6bd3f26a1f053c897f6bdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1405-a494545483635d3d93d19e8f483f61e7d4198383: a494545483635d3d93d19e8f483f61e7d4198383
  xe-pw-134508v1: 134508v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134508v1/index.html

--===============2591659953359529109==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134508/">https://patchwork.freedesktop.org/series/134508/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134508v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134508v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1405-a494545483635d3d93d19e8f483f61e7d4198383_BAT -&gt; xe-pw-134508v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7878 -&gt; IGT_7879</li>
<li>Linux: xe-1405-a494545483635d3d93d19e8f483f61e7d4198383 -&gt; xe-pw-134508v1</li>
</ul>
<p>IGT_7878: eecd5683bd98cee3fc6bd3f26a1f053c897f6bdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1405-a494545483635d3d93d19e8f483f61e7d4198383: a494545483635d3d93d19e8f483f61e7d4198383<br />
  xe-pw-134508v1: 134508v1</p>

</body>
</html>

--===============2591659953359529109==--
