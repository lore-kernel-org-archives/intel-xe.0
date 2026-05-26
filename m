Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA24CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 17:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC9710E4BE;
	Tue, 26 May 2026 17:07:05 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4533410E1D0;
 Tue, 26 May 2026 17:07:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5953422536446594051=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Do_not_allow_sett?=
 =?utf-8?q?ing_the_same_exec_queue_property_twice?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 May 2026 17:07:04 -0000
Message-ID: <177981522427.11680.6675630569261911759@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526141659.13838-1-dev@lankhorst.se>
In-Reply-To: <20260526141659.13838-1-dev@lankhorst.se>
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

--===============5953422536446594051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Do not allow setting the same exec queue property twice
URL   : https://patchwork.freedesktop.org/series/167289/
State : success

== Summary ==

CI Bug Log - changes from xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33_BAT -> xe-pw-167289v1_BAT
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

  * IGT: IGT_8937 -> IGT_8938
  * Linux: xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33 -> xe-pw-167289v1

  IGT_8937: 8937
  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33: ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33
  xe-pw-167289v1: 167289v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167289v1/index.html

--===============5953422536446594051==
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
<tr><td><b>Series:</b></td><td>drm/xe: Do not allow setting the same exec queue property twice</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167289/">https://patchwork.freedesktop.org/series/167289/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167289v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167289v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33_BAT -&gt; xe-pw-167289v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8937 -&gt; IGT_8938</li>
<li>Linux: xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33 -&gt; xe-pw-167289v1</li>
</ul>
<p>IGT_8937: 8937<br />
  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33: ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33<br />
  xe-pw-167289v1: 167289v1</p>

</body>
</html>

--===============5953422536446594051==--
