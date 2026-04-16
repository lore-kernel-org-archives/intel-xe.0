Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3798F433D0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 02:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7899E10E07A;
	Thu, 16 Apr 2026 02:04:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C4010E07A;
 Thu, 16 Apr 2026 02:04:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6269743362452664286=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm=3A_handle_IRQ=5FHPD_eve?=
 =?utf-8?q?nts_correctly?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 02:04:18 -0000
Message-ID: <177630505805.466823.10636321665970938710@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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

--===============6269743362452664286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: handle IRQ_HPD events correctly
URL   : https://patchwork.freedesktop.org/series/164955/
State : success

== Summary ==

CI Bug Log - changes from xe-4908-b2dbef367fba940bdaca7a3a3645c4be3d3c8ff9_BAT -> xe-pw-164955v1_BAT
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

  * Linux: xe-4908-b2dbef367fba940bdaca7a3a3645c4be3d3c8ff9 -> xe-pw-164955v1

  IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4908-b2dbef367fba940bdaca7a3a3645c4be3d3c8ff9: b2dbef367fba940bdaca7a3a3645c4be3d3c8ff9
  xe-pw-164955v1: 164955v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v1/index.html

--===============6269743362452664286==
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
<tr><td><b>Series:</b></td><td>drm: handle IRQ_HPD events correctly</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164955/">https://patchwork.freedesktop.org/series/164955/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4908-b2dbef367fba940bdaca7a3a3645c4be3d3c8ff9_BAT -&gt; xe-pw-164955v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4908-b2dbef367fba940bdaca7a3a3645c4be3d3c8ff9 -&gt; xe-pw-164955v1</li>
</ul>
<p>IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4908-b2dbef367fba940bdaca7a3a3645c4be3d3c8ff9: b2dbef367fba940bdaca7a3a3645c4be3d3c8ff9<br />
  xe-pw-164955v1: 164955v1</p>

</body>
</html>

--===============6269743362452664286==--
