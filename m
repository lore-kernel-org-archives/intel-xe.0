Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC70C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 20:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439AD10E4AC;
	Mon, 19 May 2025 20:59:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95010E4AC;
 Mon, 19 May 2025 20:59:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5435864417255845797=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Allow_to_trigger_?=
 =?utf-8?q?GT_resets_using_debugfs_writes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 May 2025 20:59:17 -0000
Message-ID: <174768835750.1850.13707124988561970553@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250519200914.216-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250519200914.216-1-michal.wajdeczko@intel.com>
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

--===============5435864417255845797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Allow to trigger GT resets using debugfs writes
URL   : https://patchwork.freedesktop.org/series/149204/
State : success

== Summary ==

CI Bug Log - changes from xe-3111-4fa9083ef235badec8ee0bf4f1d8d2594b1c6539_BAT -> xe-pw-149204v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3111-4fa9083ef235badec8ee0bf4f1d8d2594b1c6539 -> xe-pw-149204v1

  IGT_8368: 8368
  xe-3111-4fa9083ef235badec8ee0bf4f1d8d2594b1c6539: 4fa9083ef235badec8ee0bf4f1d8d2594b1c6539
  xe-pw-149204v1: 149204v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149204v1/index.html

--===============5435864417255845797==
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
<tr><td><b>Series:</b></td><td>drm/xe: Allow to trigger GT resets using debugfs writes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149204/">https://patchwork.freedesktop.org/series/149204/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149204v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149204v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3111-4fa9083ef235badec8ee0bf4f1d8d2594b1c6539_BAT -&gt; xe-pw-149204v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3111-4fa9083ef235badec8ee0bf4f1d8d2594b1c6539 -&gt; xe-pw-149204v1</li>
</ul>
<p>IGT_8368: 8368<br />
  xe-3111-4fa9083ef235badec8ee0bf4f1d8d2594b1c6539: 4fa9083ef235badec8ee0bf4f1d8d2594b1c6539<br />
  xe-pw-149204v1: 149204v1</p>

</body>
</html>

--===============5435864417255845797==--
