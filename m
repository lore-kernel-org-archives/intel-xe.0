Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0ACC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 17:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A9A10EB48;
	Wed, 15 May 2024 17:53:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DA710E04F;
 Wed, 15 May 2024 17:53:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4927600943285658011=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_add_mmio_debugfs_file_?=
 =?utf-8?q?=26_restore_xe=5Fmmio=5Fioctl_as_its_ioctl_handler_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 May 2024 17:53:22 -0000
Message-ID: <171579560209.2118035.7141012791322601013@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515165244.156194-1-kelbaz@habana.ai>
In-Reply-To: <20240515165244.156194-1-kelbaz@habana.ai>
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

--===============4927600943285658011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: add mmio debugfs file & restore xe_mmio_ioctl as its ioctl handler (rev2)
URL   : https://patchwork.freedesktop.org/series/133505/
State : success

== Summary ==

CI Bug Log - changes from xe-1292-d98c9eae84056cb2d86293c145234017681f09f4_BAT -> xe-pw-133505v2_BAT
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

  * IGT: IGT_7854 -> IGT_7855
  * Linux: xe-1292-d98c9eae84056cb2d86293c145234017681f09f4 -> xe-pw-133505v2

  IGT_7854: 8abb25ffe588020cf0b797d60ad1f3f9e7c0764a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7855: 7855
  xe-1292-d98c9eae84056cb2d86293c145234017681f09f4: d98c9eae84056cb2d86293c145234017681f09f4
  xe-pw-133505v2: 133505v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133505v2/index.html

--===============4927600943285658011==
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
<tr><td><b>Series:</b></td><td>drm/xe: add mmio debugfs file &amp; restore xe_mmio_ioctl as its ioctl handler (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133505/">https://patchwork.freedesktop.org/series/133505/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133505v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133505v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1292-d98c9eae84056cb2d86293c145234017681f09f4_BAT -&gt; xe-pw-133505v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7854 -&gt; IGT_7855</li>
<li>Linux: xe-1292-d98c9eae84056cb2d86293c145234017681f09f4 -&gt; xe-pw-133505v2</li>
</ul>
<p>IGT_7854: 8abb25ffe588020cf0b797d60ad1f3f9e7c0764a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7855: 7855<br />
  xe-1292-d98c9eae84056cb2d86293c145234017681f09f4: d98c9eae84056cb2d86293c145234017681f09f4<br />
  xe-pw-133505v2: 133505v2</p>

</body>
</html>

--===============4927600943285658011==--
