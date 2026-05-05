Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBA7FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 11:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E905610E122;
	Tue,  5 May 2026 11:00:14 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8994410E122;
 Tue,  5 May 2026 11:00:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5263918108529045869=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_start_s?=
 =?utf-8?q?witching_to_display_specific_reg_types_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 11:00:13 -0000
Message-ID: <177797881355.38341.4310407056419655690@5ab824fced77>
X-Patchwork-Hint: ignore
References: <cover.1777972548.git.jani.nikula@intel.com>
In-Reply-To: <cover.1777972548.git.jani.nikula@intel.com>
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

--===============5263918108529045869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: start switching to display specific reg types (rev2)
URL   : https://patchwork.freedesktop.org/series/164540/
State : success

== Summary ==

CI Bug Log - changes from xe-4985-080a06082eb178e71ef38b4e2ac94a2274874c04_BAT -> xe-pw-164540v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4985-080a06082eb178e71ef38b4e2ac94a2274874c04 -> xe-pw-164540v2

  IGT_8886: 0c1d7a87341d565ed0dfb6ae37e6aa851fede9cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4985-080a06082eb178e71ef38b4e2ac94a2274874c04: 080a06082eb178e71ef38b4e2ac94a2274874c04
  xe-pw-164540v2: 164540v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164540v2/index.html

--===============5263918108529045869==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: start switching to display specific reg types (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164540/">https://patchwork.freedesktop.org/series/164540/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164540v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164540v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4985-080a06082eb178e71ef38b4e2ac94a2274874c04_BAT -&gt; xe-pw-164540v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4985-080a06082eb178e71ef38b4e2ac94a2274874c04 -&gt; xe-pw-164540v2</li>
</ul>
<p>IGT_8886: 0c1d7a87341d565ed0dfb6ae37e6aa851fede9cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4985-080a06082eb178e71ef38b4e2ac94a2274874c04: 080a06082eb178e71ef38b4e2ac94a2274874c04<br />
  xe-pw-164540v2: 164540v2</p>

</body>
</html>

--===============5263918108529045869==--
