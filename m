Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6D9C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 06:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9016C10E129;
	Thu, 18 Jan 2024 06:25:51 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9666710E129;
 Thu, 18 Jan 2024 06:25:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5062476728956025085=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Set_PTE=5FAE_for_xe2_d?=
 =?utf-8?q?gfx_platforms_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Thu, 18 Jan 2024 06:25:50 -0000
Message-ID: <170555915061.537692.9381385690647052606@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117144851.22952-1-nirmoy.das@intel.com>
In-Reply-To: <20240117144851.22952-1-nirmoy.das@intel.com>
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

--===============5062476728956025085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Set PTE_AE for xe2 dgfx platforms (rev2)
URL   : https://patchwork.freedesktop.org/series/128887/
State : success

== Summary ==

CI Bug Log - changes from xe-642-2d422dec58e0dfd61d6c9842de7f83289803dccb_BAT -> xe-pw-128887v2_BAT
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

  * Linux: xe-642-2d422dec58e0dfd61d6c9842de7f83289803dccb -> xe-pw-128887v2

  IGT_7678: 9f0b63bae98fa6164dd2262f8890a964fb1fc23d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-642-2d422dec58e0dfd61d6c9842de7f83289803dccb: 2d422dec58e0dfd61d6c9842de7f83289803dccb
  xe-pw-128887v2: 128887v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128887v2/index.html

--===============5062476728956025085==
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
<tr><td><b>Series:</b></td><td>drm/xe: Set PTE_AE for xe2 dgfx platforms (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128887/">https://patchwork.freedesktop.org/series/128887/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128887v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128887v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-642-2d422dec58e0dfd61d6c9842de7f83289803dccb_BAT -&gt; xe-pw-128887v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-642-2d422dec58e0dfd61d6c9842de7f83289803dccb -&gt; xe-pw-128887v2</li>
</ul>
<p>IGT_7678: 9f0b63bae98fa6164dd2262f8890a964fb1fc23d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-642-2d422dec58e0dfd61d6c9842de7f83289803dccb: 2d422dec58e0dfd61d6c9842de7f83289803dccb<br />
  xe-pw-128887v2: 128887v2</p>

</body>
</html>

--===============5062476728956025085==--
