Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7A1CD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 17:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0018A10E351;
	Mon, 25 May 2026 17:42:08 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D47A10E223;
 Mon, 25 May 2026 17:42:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8847217320801700931=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Misc_initializati?=
 =?utf-8?q?on_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 17:42:08 -0000
Message-ID: <177973092844.5829.8311549180063212063@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260525160529.15890-1-michal.wajdeczko@intel.com>
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

--===============8847217320801700931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Misc initialization improvements
URL   : https://patchwork.freedesktop.org/series/167227/
State : success

== Summary ==

CI Bug Log - changes from xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b_BAT -> xe-pw-167227v1_BAT
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

  * IGT: IGT_8936 -> IGT_8937
  * Linux: xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b -> xe-pw-167227v1

  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8937: 8937
  xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b: 04d475020800d0a1033ca89a0d6d5fc638ddc65b
  xe-pw-167227v1: 167227v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167227v1/index.html

--===============8847217320801700931==
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
<tr><td><b>Series:</b></td><td>drm/xe: Misc initialization improvements</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167227/">https://patchwork.freedesktop.org/series/167227/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167227v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167227v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b_BAT -&gt; xe-pw-167227v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8936 -&gt; IGT_8937</li>
<li>Linux: xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b -&gt; xe-pw-167227v1</li>
</ul>
<p>IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8937: 8937<br />
  xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b: 04d475020800d0a1033ca89a0d6d5fc638ddc65b<br />
  xe-pw-167227v1: 167227v1</p>

</body>
</html>

--===============8847217320801700931==--
