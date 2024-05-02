Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E267BC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 19:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FC910E631;
	Thu,  2 May 2024 19:44:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9241A10E631;
 Thu,  2 May 2024 19:44:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8534117360138185503=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Perform_dma=5Fmap_when?=
 =?utf-8?q?_moving_system_buffer_objects_to_TT_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 19:44:21 -0000
Message-ID: <171467906159.1869305.6003605172434853285@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502183251.10170-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240502183251.10170-1-thomas.hellstrom@linux.intel.com>
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

--===============8534117360138185503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Perform dma_map when moving system buffer objects to TT (rev3)
URL   : https://patchwork.freedesktop.org/series/133068/
State : success

== Summary ==

CI Bug Log - changes from xe-1224-83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6_BAT -> xe-pw-133068v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1224-83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6 -> xe-pw-133068v3

  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1224-83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6: 83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6
  xe-pw-133068v3: 133068v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/index.html

--===============8534117360138185503==
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
<tr><td><b>Series:</b></td><td>drm/xe: Perform dma_map when moving system buffer objects to TT (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133068/">https://patchwork.freedesktop.org/series/133068/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1224-83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6_BAT -&gt; xe-pw-133068v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1224-83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6 -&gt; xe-pw-133068v3</li>
</ul>
<p>IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1224-83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6: 83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6<br />
  xe-pw-133068v3: 133068v3</p>

</body>
</html>

--===============8534117360138185503==--
