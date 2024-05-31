Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3471BC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 11:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D678D10E4B8;
	Fri, 31 May 2024 11:44:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B6210E4B8;
 Fri, 31 May 2024 11:44:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4825416589892612630=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe2lpm=3A_Add_permanent_W?=
 =?utf-8?q?a=5F14020756599_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 May 2024 11:44:33 -0000
Message-ID: <171715587333.2241151.11661797091060531008@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240531110022.551477-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240531110022.551477-1-tejas.upadhyay@intel.com>
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

--===============4825416589892612630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2lpm: Add permanent Wa_14020756599 (rev2)
URL   : https://patchwork.freedesktop.org/series/134245/
State : success

== Summary ==

CI Bug Log - changes from xe-1388-e243c3df9467f54d3d2544f42b5845b6b5f41d3e_BAT -> xe-pw-134245v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7874 -> IGT_7875
  * Linux: xe-1388-e243c3df9467f54d3d2544f42b5845b6b5f41d3e -> xe-pw-134245v2

  IGT_7874: 4d9b4ee12b5f0852c02818ca9a886355b43fbbff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7875: 44d48b5aec41357e90aa7990c8877ca807ff8d57 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1388-e243c3df9467f54d3d2544f42b5845b6b5f41d3e: e243c3df9467f54d3d2544f42b5845b6b5f41d3e
  xe-pw-134245v2: 134245v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134245v2/index.html

--===============4825416589892612630==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2lpm: Add permanent Wa_14020756599 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134245/">https://patchwork.freedesktop.org/series/134245/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134245v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134245v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1388-e243c3df9467f54d3d2544f42b5845b6b5f41d3e_BAT -&gt; xe-pw-134245v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7874 -&gt; IGT_7875</li>
<li>Linux: xe-1388-e243c3df9467f54d3d2544f42b5845b6b5f41d3e -&gt; xe-pw-134245v2</li>
</ul>
<p>IGT_7874: 4d9b4ee12b5f0852c02818ca9a886355b43fbbff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7875: 44d48b5aec41357e90aa7990c8877ca807ff8d57 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1388-e243c3df9467f54d3d2544f42b5845b6b5f41d3e: e243c3df9467f54d3d2544f42b5845b6b5f41d3e<br />
  xe-pw-134245v2: 134245v2</p>

</body>
</html>

--===============4825416589892612630==--
