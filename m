Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303A3C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 16:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC8510EEC2;
	Mon, 29 Jan 2024 16:29:47 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2681610E190;
 Mon, 29 Jan 2024 16:29:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8632816789752549751=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Grab_mem=5Faccess_when?=
 =?utf-8?q?_disabling_C6_on_skip=5Fguc=5Fpc_platforms_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Mon, 29 Jan 2024 16:29:47 -0000
Message-ID: <170654578715.806401.16166121334742078158@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240126220613.865939-2-matthew.d.roper@intel.com>
In-Reply-To: <20240126220613.865939-2-matthew.d.roper@intel.com>
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

--===============8632816789752549751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Grab mem_access when disabling C6 on skip_guc_pc platforms (rev2)
URL   : https://patchwork.freedesktop.org/series/129221/
State : success

== Summary ==

CI Bug Log - changes from xe-697-114c7e14fc8f30c4f3e0a39819b7d138ff5ef259_BAT -> xe-pw-129221v2_BAT
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

  * Linux: xe-697-114c7e14fc8f30c4f3e0a39819b7d138ff5ef259 -> xe-pw-129221v2

  IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-697-114c7e14fc8f30c4f3e0a39819b7d138ff5ef259: 114c7e14fc8f30c4f3e0a39819b7d138ff5ef259
  xe-pw-129221v2: 129221v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129221v2/index.html

--===============8632816789752549751==
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
<tr><td><b>Series:</b></td><td>drm/xe: Grab mem_access when disabling C6 on skip_guc_pc platforms (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129221/">https://patchwork.freedesktop.org/series/129221/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129221v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129221v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-697-114c7e14fc8f30c4f3e0a39819b7d138ff5ef259_BAT -&gt; xe-pw-129221v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-697-114c7e14fc8f30c4f3e0a39819b7d138ff5ef259 -&gt; xe-pw-129221v2</li>
</ul>
<p>IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-697-114c7e14fc8f30c4f3e0a39819b7d138ff5ef259: 114c7e14fc8f30c4f3e0a39819b7d138ff5ef259<br />
  xe-pw-129221v2: 129221v2</p>

</body>
</html>

--===============8632816789752549751==--
