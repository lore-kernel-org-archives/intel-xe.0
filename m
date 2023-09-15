Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0F7EE6459
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 11:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB5810E17D;
	Fri, 15 Sep 2023 11:42:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 60D3410E17C;
 Fri, 15 Sep 2023 11:42:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5024AAADF3;
 Fri, 15 Sep 2023 11:42:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6245702493500370225=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 15 Sep 2023 11:42:16 -0000
Message-ID: <169477813629.32041.17376623521694540391@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
In-Reply-To: <20230915105724.1025509-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Backport_?=
 =?utf-8?q?patches_reorganizing_intel=5Ffrontbuffer=2Eh/i915=5Fgem=5Fobjec?=
 =?utf-8?b?dC5o?=
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

--===============6245702493500370225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Backport patches reorganizing intel_frontbuffer.h/i915_gem_object.h
URL   : https://patchwork.freedesktop.org/series/123757/
State : success

== Summary ==

CI Bug Log - changes from xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63_BAT -> xe-pw-123757v1_BAT
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

  * IGT: IGT_7488 -> IGT_7489
  * Linux: xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63 -> xe-pw-123757v1

  IGT_7488: 099e058c5dfb7a49942edf03cae88a52a77077a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7489: c31111635650e76263faee031292290b1a393f2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63: 4a9681392cecd56a372d06b648f7b3a37fdd5c63
  xe-pw-123757v1: 123757v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123757v1/index.html

--===============6245702493500370225==
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
<tr><td><b>Series:</b></td><td>Backport patches reorganizing intel_frontbuffer.h/i915_gem_object.h</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123757/">https://patchwork.freedesktop.org/series/123757/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123757v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123757v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63_BAT -&gt; xe-pw-123757v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7488 -&gt; IGT_7489</li>
<li>Linux: xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63 -&gt; xe-pw-123757v1</li>
</ul>
<p>IGT_7488: 099e058c5dfb7a49942edf03cae88a52a77077a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7489: c31111635650e76263faee031292290b1a393f2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63: 4a9681392cecd56a372d06b648f7b3a37fdd5c63<br />
  xe-pw-123757v1: 123757v1</p>

</body>
</html>

--===============6245702493500370225==--
