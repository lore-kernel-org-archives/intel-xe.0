Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D26C5DF9D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 08:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D3A10E3D4;
	Thu, 27 Aug 2026 08:07:27 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E090810E3D2;
 Thu, 27 Aug 2026 08:07:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8019514771063848929=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_debugfs_knob_?=
 =?utf-8?q?to_control_GPGPU_preemption_granularity?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Aug 2026 08:07:24 -0000
Message-ID: <178781804491.90152.14344067794853749442@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827072106.1138741-2-varun.gupta@intel.com>
In-Reply-To: <20260827072106.1138741-2-varun.gupta@intel.com>
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

--===============8019514771063848929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add debugfs knob to control GPGPU preemption granularity
URL   : https://patchwork.freedesktop.org/series/172840/
State : success

== Summary ==

CI Bug Log - changes from xe-5651-acd8191c76e28f9b260f6701573fd1d2c76dd0f6_BAT -> xe-pw-172840v1_BAT
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

  * Linux: xe-5651-acd8191c76e28f9b260f6701573fd1d2c76dd0f6 -> xe-pw-172840v1

  IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5651-acd8191c76e28f9b260f6701573fd1d2c76dd0f6: acd8191c76e28f9b260f6701573fd1d2c76dd0f6
  xe-pw-172840v1: 172840v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172840v1/index.html

--===============8019514771063848929==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add debugfs knob to control GPGPU preemption granularity</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172840/">https://patchwork.freedesktop.org/series/172840/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172840v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172840v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5651-acd8191c76e28f9b260f6701573fd1d2c76dd0f6_BAT -&gt; xe-pw-172840v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5651-acd8191c76e28f9b260f6701573fd1d2c76dd0f6 -&gt; xe-pw-172840v1</li>
</ul>
<p>IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5651-acd8191c76e28f9b260f6701573fd1d2c76dd0f6: acd8191c76e28f9b260f6701573fd1d2c76dd0f6<br />
  xe-pw-172840v1: 172840v1</p>

</body>
</html>

--===============8019514771063848929==--
