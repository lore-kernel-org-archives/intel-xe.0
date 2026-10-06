Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AE7CA6002
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 14:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F125610E102;
	Tue,  6 Oct 2026 14:22:20 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C148910E102;
 Tue,  6 Oct 2026 14:22:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7716913069604544839=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Followup_fixes_for_memory_p?=
 =?utf-8?q?age_offline_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Oct 2026 14:22:19 -0000
Message-ID: <179129653978.244522.10537482044869578516@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006124125.1560295-6-tejas.upadhyay@intel.com>
In-Reply-To: <20261006124125.1560295-6-tejas.upadhyay@intel.com>
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

--===============7716913069604544839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Followup fixes for memory page offline (rev2)
URL   : https://patchwork.freedesktop.org/series/175353/
State : success

== Summary ==

CI Bug Log - changes from xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c_BAT -> xe-pw-175353v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9130 -> IGT_9131
  * Linux: xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c -> xe-pw-175353v2

  IGT_9130: 9130
  IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c: 7db399fbf387d3656d4a43bdc7d9580e3880bc2c
  xe-pw-175353v2: 175353v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175353v2/index.html

--===============7716913069604544839==
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
<tr><td><b>Series:</b></td><td>Followup fixes for memory page offline (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175353/">https://patchwork.freedesktop.org/series/175353/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175353v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175353v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c_BAT -&gt; xe-pw-175353v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9130 -&gt; IGT_9131</li>
<li>Linux: xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c -&gt; xe-pw-175353v2</li>
</ul>
<p>IGT_9130: 9130<br />
  IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c: 7db399fbf387d3656d4a43bdc7d9580e3880bc2c<br />
  xe-pw-175353v2: 175353v2</p>

</body>
</html>

--===============7716913069604544839==--
