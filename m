Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F4C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 17:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C588610E2E4;
	Thu, 25 Jul 2024 17:48:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B9D10E25E;
 Thu, 25 Jul 2024 17:48:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5263782874797186762=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915=3A_Fix_possible_int_ove?=
 =?utf-8?q?rflow_in_skl=5Fddi=5Fcalculate=5Fwrpll=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nikita Zhandarovich" <n.zhandarovich@fintech.ru>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 17:48:09 -0000
Message-ID: <172192968941.383131.8637522358171088870@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724184911.12250-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240724184911.12250-1-n.zhandarovich@fintech.ru>
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

--===============5263782874797186762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()
URL   : https://patchwork.freedesktop.org/series/136513/
State : success

== Summary ==

CI Bug Log - changes from xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d_BAT -> xe-pw-136513v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d -> xe-pw-136513v1

  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d: 9f8e597a1c39d7e316f9479e6f627c15dbc58e1d
  xe-pw-136513v1: 136513v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136513v1/index.html

--===============5263782874797186762==
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
<tr><td><b>Series:</b></td><td>drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136513/">https://patchwork.freedesktop.org/series/136513/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136513v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136513v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d_BAT -&gt; xe-pw-136513v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d -&gt; xe-pw-136513v1</li>
</ul>
<p>IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d: 9f8e597a1c39d7e316f9479e6f627c15dbc58e1d<br />
  xe-pw-136513v1: 136513v1</p>

</body>
</html>

--===============5263782874797186762==--
