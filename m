Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DC9CA5FC4
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 19:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D8710F313;
	Wed, 30 Sep 2026 19:05:59 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD39010F313;
 Wed, 30 Sep 2026 19:05:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4088551305002090841=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_focused_VM_te?=
 =?utf-8?q?ardown_and_page_fault_tracing_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Sep 2026 19:05:58 -0000
Message-ID: <179079515876.225808.8519893695040136851@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260930164645.1243801-1-daniel.charles@intel.com>
In-Reply-To: <20260930164645.1243801-1-daniel.charles@intel.com>
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

--===============4088551305002090841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add focused VM teardown and page fault tracing (rev4)
URL   : https://patchwork.freedesktop.org/series/175023/
State : success

== Summary ==

CI Bug Log - changes from xe-5850-b7036096f753a7fe43361478bcf22c04f23387a8_BAT -> xe-pw-175023v4_BAT
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

  * Linux: xe-5850-b7036096f753a7fe43361478bcf22c04f23387a8 -> xe-pw-175023v4

  IGT_9118: 26513be3e0f711ed835ec50d5cdcb723ef224105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5850-b7036096f753a7fe43361478bcf22c04f23387a8: b7036096f753a7fe43361478bcf22c04f23387a8
  xe-pw-175023v4: 175023v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175023v4/index.html

--===============4088551305002090841==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add focused VM teardown and page fault tracing (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175023/">https://patchwork.freedesktop.org/series/175023/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175023v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175023v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5850-b7036096f753a7fe43361478bcf22c04f23387a8_BAT -&gt; xe-pw-175023v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5850-b7036096f753a7fe43361478bcf22c04f23387a8 -&gt; xe-pw-175023v4</li>
</ul>
<p>IGT_9118: 26513be3e0f711ed835ec50d5cdcb723ef224105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5850-b7036096f753a7fe43361478bcf22c04f23387a8: b7036096f753a7fe43361478bcf22c04f23387a8<br />
  xe-pw-175023v4: 175023v4</p>

</body>
</html>

--===============4088551305002090841==--
