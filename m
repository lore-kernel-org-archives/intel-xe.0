Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A837BCA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 22:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0B410E053;
	Mon, 12 Oct 2026 22:04:24 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678E810E053;
 Mon, 12 Oct 2026 22:04:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2802607270511295979=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Capture_additiona?=
 =?utf-8?q?l_HW_register_state_in_devcoredump_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Oct 2026 22:04:22 -0000
Message-ID: <179184266241.14697.9990322566854710945@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
In-Reply-To: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
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

--===============2802607270511295979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Capture additional HW register state in devcoredump (rev4)
URL   : https://patchwork.freedesktop.org/series/172150/
State : success

== Summary ==

CI Bug Log - changes from xe-5932-c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0_BAT -> xe-pw-172150v4_BAT
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

  * Linux: xe-5932-c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0 -> xe-pw-172150v4

  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5932-c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0: c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0
  xe-pw-172150v4: 172150v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v4/index.html

--===============2802607270511295979==
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
<tr><td><b>Series:</b></td><td>drm/xe: Capture additional HW register state in devcoredump (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172150/">https://patchwork.freedesktop.org/series/172150/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5932-c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0_BAT -&gt; xe-pw-172150v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5932-c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0 -&gt; xe-pw-172150v4</li>
</ul>
<p>IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5932-c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0: c159c34a6f6ab5c1931e5e0f0d6d34ad23528bf0<br />
  xe-pw-172150v4: 172150v4</p>

</body>
</html>

--===============2802607270511295979==--
