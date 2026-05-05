Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7DBCD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 13:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC0F10E41F;
	Tue,  5 May 2026 13:29:12 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A674110E41F;
 Tue,  5 May 2026 13:29:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5059403128702573278=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/hdcp=3A_Skip_inact?=
 =?utf-8?q?ive_MST_connectors_when_building_stream_list?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 13:29:11 -0000
Message-ID: <177798775167.38341.1912634941935118754@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260505094022.4064256-1-suraj.kandpal@intel.com>
In-Reply-To: <20260505094022.4064256-1-suraj.kandpal@intel.com>
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

--===============5059403128702573278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdcp: Skip inactive MST connectors when building stream list
URL   : https://patchwork.freedesktop.org/series/165992/
State : success

== Summary ==

CI Bug Log - changes from xe-4986-fa7a3955d5aca4e8e7299ee765637de39009850e_BAT -> xe-pw-165992v1_BAT
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

  * Linux: xe-4986-fa7a3955d5aca4e8e7299ee765637de39009850e -> xe-pw-165992v1

  IGT_8886: 0c1d7a87341d565ed0dfb6ae37e6aa851fede9cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4986-fa7a3955d5aca4e8e7299ee765637de39009850e: fa7a3955d5aca4e8e7299ee765637de39009850e
  xe-pw-165992v1: 165992v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165992v1/index.html

--===============5059403128702573278==
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
<tr><td><b>Series:</b></td><td>drm/i915/hdcp: Skip inactive MST connectors when building stream list</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165992/">https://patchwork.freedesktop.org/series/165992/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165992v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165992v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4986-fa7a3955d5aca4e8e7299ee765637de39009850e_BAT -&gt; xe-pw-165992v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4986-fa7a3955d5aca4e8e7299ee765637de39009850e -&gt; xe-pw-165992v1</li>
</ul>
<p>IGT_8886: 0c1d7a87341d565ed0dfb6ae37e6aa851fede9cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4986-fa7a3955d5aca4e8e7299ee765637de39009850e: fa7a3955d5aca4e8e7299ee765637de39009850e<br />
  xe-pw-165992v1: 165992v1</p>

</body>
</html>

--===============5059403128702573278==--
