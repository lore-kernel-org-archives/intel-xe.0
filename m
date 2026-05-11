Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D09CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5653410E1A8;
	Mon, 11 May 2026 12:45:54 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0288D10E1A8;
 Mon, 11 May 2026 12:45:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0924280342312900113=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/display/dp=5Ftunnel=3A_?=
 =?utf-8?q?Add_debugfs_surface_for_BWA_validation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 May 2026 12:45:53 -0000
Message-ID: <177850355300.56505.14268891267582759716@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511054028.1310995-1-kunal1.joshi@intel.com>
In-Reply-To: <20260511054028.1310995-1-kunal1.joshi@intel.com>
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

--===============0924280342312900113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/display/dp_tunnel: Add debugfs surface for BWA validation
URL   : https://patchwork.freedesktop.org/series/166288/
State : success

== Summary ==

CI Bug Log - changes from xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c_BAT -> xe-pw-166288v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c -> xe-pw-166288v1

  IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c: a86f5af06a7f8fa3c0a87caa138d06824f87878c
  xe-pw-166288v1: 166288v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166288v1/index.html

--===============0924280342312900113==
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
<tr><td><b>Series:</b></td><td>drm/display/dp_tunnel: Add debugfs surface for BWA validation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166288/">https://patchwork.freedesktop.org/series/166288/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166288v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166288v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c_BAT -&gt; xe-pw-166288v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c -&gt; xe-pw-166288v1</li>
</ul>
<p>IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c: a86f5af06a7f8fa3c0a87caa138d06824f87878c<br />
  xe-pw-166288v1: 166288v1</p>

</body>
</html>

--===============0924280342312900113==--
