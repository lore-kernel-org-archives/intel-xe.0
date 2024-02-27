Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B410C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 13:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A2B10E0E8;
	Tue, 27 Feb 2024 13:51:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B34610E479;
 Tue, 27 Feb 2024 13:51:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7503897171958990026=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv3=2C1/3?=
 =?utf-8?q?=5D_=60drm/xe=3A_Move_lrc_snapshot_capturing_to_xe=5Flrc=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 13:51:25 -0000
Message-ID: <170904188543.337360.15204275895713787682@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
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

--===============7503897171958990026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/3] `drm/xe: Move lrc snapshot capturing to xe_lrc.c
URL   : https://patchwork.freedesktop.org/series/130434/
State : success

== Summary ==

CI Bug Log - changes from xe-857-23f6fff9b5fec84f21e8a6f83cf60c1ff6007887_BAT -> xe-pw-130434v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-857-23f6fff9b5fec84f21e8a6f83cf60c1ff6007887 -> xe-pw-130434v1

  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-857-23f6fff9b5fec84f21e8a6f83cf60c1ff6007887: 23f6fff9b5fec84f21e8a6f83cf60c1ff6007887
  xe-pw-130434v1: 130434v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130434v1/index.html

--===============7503897171958990026==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/3] `drm/xe: Move lrc snapshot capturing to xe_lrc.c</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130434/">https://patchwork.freedesktop.org/series/130434/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130434v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130434v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-857-23f6fff9b5fec84f21e8a6f83cf60c1ff6007887_BAT -&gt; xe-pw-130434v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-857-23f6fff9b5fec84f21e8a6f83cf60c1ff6007887 -&gt; xe-pw-130434v1</li>
</ul>
<p>IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-857-23f6fff9b5fec84f21e8a6f83cf60c1ff6007887: 23f6fff9b5fec84f21e8a6f83cf60c1ff6007887<br />
  xe-pw-130434v1: 130434v1</p>

</body>
</html>

--===============7503897171958990026==--
