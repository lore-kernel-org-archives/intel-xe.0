Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CB5E7D0D0
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 06:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0272B10E06A;
	Fri, 22 Sep 2023 06:35:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B8DC310E061;
 Fri, 22 Sep 2023 06:35:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B1D05A73C7;
 Fri, 22 Sep 2023 06:35:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5983699935782871671=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Fri, 22 Sep 2023 06:35:23 -0000
Message-ID: <169536452372.5198.3716906125149890594@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230921111434.3051325-1-jouni.hogander@intel.com>
In-Reply-To: <20230921111434.3051325-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Xe_runtim?=
 =?utf-8?q?e_pm_refactoring_=28rev3=29?=
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

--===============5983699935782871671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Xe runtime pm refactoring (rev3)
URL   : https://patchwork.freedesktop.org/series/123834/
State : success

== Summary ==

CI Bug Log - changes from xe-389-7e0d40e7aa56f19a9b3e9bc492003085f9be01c3_BAT -> xe-pw-123834v3_BAT
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

  * IGT: IGT_7495 -> IGT_7496
  * Linux: xe-389-7e0d40e7aa56f19a9b3e9bc492003085f9be01c3 -> xe-pw-123834v3

  IGT_7495: 7ed6190bc4f8a3ebc3f0b8b334e8ae6abae03031 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7496: 6a96d3ad178e468b74a58cc10dead2f57bc1558d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-389-7e0d40e7aa56f19a9b3e9bc492003085f9be01c3: 7e0d40e7aa56f19a9b3e9bc492003085f9be01c3
  xe-pw-123834v3: 123834v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123834v3/index.html

--===============5983699935782871671==
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
<tr><td><b>Series:</b></td><td>Xe runtime pm refactoring (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123834/">https://patchwork.freedesktop.org/series/123834/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123834v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123834v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-389-7e0d40e7aa56f19a9b3e9bc492003085f9be01c3_BAT -&gt; xe-pw-123834v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7495 -&gt; IGT_7496</li>
<li>Linux: xe-389-7e0d40e7aa56f19a9b3e9bc492003085f9be01c3 -&gt; xe-pw-123834v3</li>
</ul>
<p>IGT_7495: 7ed6190bc4f8a3ebc3f0b8b334e8ae6abae03031 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7496: 6a96d3ad178e468b74a58cc10dead2f57bc1558d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-389-7e0d40e7aa56f19a9b3e9bc492003085f9be01c3: 7e0d40e7aa56f19a9b3e9bc492003085f9be01c3<br />
  xe-pw-123834v3: 123834v3</p>

</body>
</html>

--===============5983699935782871671==--
