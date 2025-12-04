Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E894AD24449
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 17:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812C310E159;
	Thu,  4 Dec 2025 17:22:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D32E10E159;
 Thu,  4 Dec 2025 17:22:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5170869908020102369=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/crtc=3A_move_crtc_?=
 =?utf-8?q?initialization_loop_to_intel=5Fcrtc=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Dec 2025 17:22:36 -0000
Message-ID: <176486895644.58753.7164356433336223209@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251204143235.3138973-1-jani.nikula@intel.com>
In-Reply-To: <20251204143235.3138973-1-jani.nikula@intel.com>
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

--===============5170869908020102369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/crtc: move crtc initialization loop to intel_crtc.c
URL   : https://patchwork.freedesktop.org/series/158502/
State : success

== Summary ==

CI Bug Log - changes from xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d_BAT -> xe-pw-158502v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d -> xe-pw-158502v1

  IGT_8655: 8655
  xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d: b91a982bdeb8b2c13917d3726c86cfa57ff3202d
  xe-pw-158502v1: 158502v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158502v1/index.html

--===============5170869908020102369==
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
<tr><td><b>Series:</b></td><td>drm/i915/crtc: move crtc initialization loop to intel_crtc.c</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158502/">https://patchwork.freedesktop.org/series/158502/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158502v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158502v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d_BAT -&gt; xe-pw-158502v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d -&gt; xe-pw-158502v1</li>
</ul>
<p>IGT_8655: 8655<br />
  xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d: b91a982bdeb8b2c13917d3726c86cfa57ff3202d<br />
  xe-pw-158502v1: 158502v1</p>

</body>
</html>

--===============5170869908020102369==--
