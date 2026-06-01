Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DDCCD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E051131BC;
	Mon,  1 Jun 2026 10:56:56 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E651131A7;
 Mon,  1 Jun 2026 10:56:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0921360554657605619=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv2?=
 =?utf-8?q?=2E1=2C1/2=5D_drm/i915/color=3A_Fix_step_discontinuity_in_Post-CS?=
 =?utf-8?q?C_Gamma_LUT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sean Paul" <sean@poorly.run>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jun 2026 10:56:56 -0000
Message-ID: <178031141639.29960.22226946827726314@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525135730.1122696-1-sean@poorly.run>
In-Reply-To: <20260525135730.1122696-1-sean@poorly.run>
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

--===============0921360554657605619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2.1,1/2] drm/i915/color: Fix step discontinuity in Post-CSC Gamma LUT (rev2)
URL   : https://patchwork.freedesktop.org/series/167280/
State : success

== Summary ==

CI Bug Log - changes from xe-5170-597564a53f6ef57bbbd688d785779e95c8f5e656_BAT -> xe-pw-167280v2_BAT
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

  * Linux: xe-5170-597564a53f6ef57bbbd688d785779e95c8f5e656 -> xe-pw-167280v2

  IGT_8943: 8943
  xe-5170-597564a53f6ef57bbbd688d785779e95c8f5e656: 597564a53f6ef57bbbd688d785779e95c8f5e656
  xe-pw-167280v2: 167280v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167280v2/index.html

--===============0921360554657605619==
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
<tr><td><b>Series:</b></td><td>series starting with [v2.1,1/2] drm/i915/color: Fix step discontinuity in Post-CSC Gamma LUT (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167280/">https://patchwork.freedesktop.org/series/167280/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167280v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167280v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5170-597564a53f6ef57bbbd688d785779e95c8f5e656_BAT -&gt; xe-pw-167280v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5170-597564a53f6ef57bbbd688d785779e95c8f5e656 -&gt; xe-pw-167280v2</li>
</ul>
<p>IGT_8943: 8943<br />
  xe-5170-597564a53f6ef57bbbd688d785779e95c8f5e656: 597564a53f6ef57bbbd688d785779e95c8f5e656<br />
  xe-pw-167280v2: 167280v2</p>

</body>
</html>

--===============0921360554657605619==--
