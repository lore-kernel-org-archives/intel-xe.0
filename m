Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241DFC10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 15:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA49D10F0BA;
	Mon,  6 May 2024 15:10:17 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126F010F0BA;
 Mon,  6 May 2024 15:10:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6467498864830815088=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Modify_minimum_of_vari?=
 =?utf-8?q?ous_scheduler_timeout_to_0?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 15:10:16 -0000
Message-ID: <171500821607.1939725.15553533119347115753@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
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

--===============6467498864830815088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Modify minimum of various scheduler timeout to 0
URL   : https://patchwork.freedesktop.org/series/133233/
State : success

== Summary ==

CI Bug Log - changes from xe-1239-5a43da669cdb9b8df66e32a661b09cd9c52e35f2_BAT -> xe-pw-133233v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1239-5a43da669cdb9b8df66e32a661b09cd9c52e35f2 -> xe-pw-133233v1

  IGT_7833: 6f89cac1b180e7cd7cbac535e65843595b2bb5bd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1239-5a43da669cdb9b8df66e32a661b09cd9c52e35f2: 5a43da669cdb9b8df66e32a661b09cd9c52e35f2
  xe-pw-133233v1: 133233v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133233v1/index.html

--===============6467498864830815088==
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
<tr><td><b>Series:</b></td><td>drm/xe: Modify minimum of various scheduler timeout to 0</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133233/">https://patchwork.freedesktop.org/series/133233/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133233v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133233v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1239-5a43da669cdb9b8df66e32a661b09cd9c52e35f2_BAT -&gt; xe-pw-133233v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1239-5a43da669cdb9b8df66e32a661b09cd9c52e35f2 -&gt; xe-pw-133233v1</li>
</ul>
<p>IGT_7833: 6f89cac1b180e7cd7cbac535e65843595b2bb5bd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1239-5a43da669cdb9b8df66e32a661b09cd9c52e35f2: 5a43da669cdb9b8df66e32a661b09cd9c52e35f2<br />
  xe-pw-133233v1: 133233v1</p>

</body>
</html>

--===============6467498864830815088==--
