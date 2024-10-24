Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB526CE8E97
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 17:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CCF10E39C;
	Thu, 24 Oct 2024 17:00:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F0710E39C;
 Thu, 24 Oct 2024 17:00:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5471400356042254570=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe/guc/tlb=3A_Flush_g2h_wor?=
 =?utf-8?q?ker_in_case_of_tlb_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 17:00:45 -0000
Message-ID: <172978924514.1327227.1494153869749916992@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
In-Reply-To: <20241023151343.3463640-1-nirmoy.das@intel.com>
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

--===============5471400356042254570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
URL   : https://patchwork.freedesktop.org/series/140382/
State : success

== Summary ==

CI Bug Log - changes from xe-2108-d5bac12430b0d4a980c0498b3c946772950e70ee_full -> xe-pw-140382v1_full
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

  * Linux: xe-2108-d5bac12430b0d4a980c0498b3c946772950e70ee -> xe-pw-140382v1

  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2108-d5bac12430b0d4a980c0498b3c946772950e70ee: d5bac12430b0d4a980c0498b3c946772950e70ee
  xe-pw-140382v1: 140382v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140382v1/index.html

--===============5471400356042254570==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140382/">https://patchwork.freedesktop.org/series/140382/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140382v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140382v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2108-d5bac12430b0d4a980c0498b3c946772950e70ee_full -&gt; xe-pw-140382v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2108-d5bac12430b0d4a980c0498b3c946772950e70ee -&gt; xe-pw-140382v1</li>
</ul>
<p>IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2108-d5bac12430b0d4a980c0498b3c946772950e70ee: d5bac12430b0d4a980c0498b3c946772950e70ee<br />
  xe-pw-140382v1: 140382v1</p>

</body>
</html>

--===============5471400356042254570==--
