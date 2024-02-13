Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F83C4829F
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 16:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F9E10E00F;
	Tue, 13 Feb 2024 16:25:53 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449ED10E00F;
 Tue, 13 Feb 2024 16:25:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3201104315335242927=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_VF_Tweaks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 16:25:52 -0000
Message-ID: <170784155229.1201024.11819455298324690621@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213154355.1221-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240213154355.1221-1-michal.wajdeczko@intel.com>
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

--===============3201104315335242927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF Tweaks (rev2)
URL   : https://patchwork.freedesktop.org/series/128727/
State : success

== Summary ==

CI Bug Log - changes from xe-769-7c8e9135509f2e438e11a4af17387a204ab59884_BAT -> xe-pw-128727v2_BAT
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

  * IGT: IGT_7710 -> IGT_7711
  * Linux: xe-769-7c8e9135509f2e438e11a4af17387a204ab59884 -> xe-pw-128727v2

  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7711: 7711
  xe-769-7c8e9135509f2e438e11a4af17387a204ab59884: 7c8e9135509f2e438e11a4af17387a204ab59884
  xe-pw-128727v2: 128727v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128727v2/index.html

--===============3201104315335242927==
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
<tr><td><b>Series:</b></td><td>VF Tweaks (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128727/">https://patchwork.freedesktop.org/series/128727/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128727v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128727v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-769-7c8e9135509f2e438e11a4af17387a204ab59884_BAT -&gt; xe-pw-128727v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7710 -&gt; IGT_7711</li>
<li>Linux: xe-769-7c8e9135509f2e438e11a4af17387a204ab59884 -&gt; xe-pw-128727v2</li>
</ul>
<p>IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7711: 7711<br />
  xe-769-7c8e9135509f2e438e11a4af17387a204ab59884: 7c8e9135509f2e438e11a4af17387a204ab59884<br />
  xe-pw-128727v2: 128727v2</p>

</body>
</html>

--===============3201104315335242927==--
