Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D514AEED617
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 16:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E85710E64A;
	Fri, 15 Sep 2023 16:30:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A148A10E64A;
 Fri, 15 Sep 2023 16:30:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8FB2FA00E6;
 Fri, 15 Sep 2023 16:30:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3677907752298042105=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Fri, 15 Sep 2023 16:30:16 -0000
Message-ID: <169479541656.32039.4057004025202208255@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230915154639.48045-1-jose.souza@intel.com>
In-Reply-To: <20230915154639.48045-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Add_uAPI_to_query_micro-controler_firmware_version_=28rev2=29?=
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

--===============3677907752298042105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add uAPI to query micro-controler firmware version (rev2)
URL   : https://patchwork.freedesktop.org/series/123779/
State : success

== Summary ==

CI Bug Log - changes from xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63_BAT -> xe-pw-123779v2_BAT
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

  * IGT: IGT_7488 -> IGT_7490
  * Linux: xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63 -> xe-pw-123779v2

  IGT_7488: 099e058c5dfb7a49942edf03cae88a52a77077a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7490: 7490
  xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63: 4a9681392cecd56a372d06b648f7b3a37fdd5c63
  xe-pw-123779v2: 123779v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123779v2/index.html

--===============3677907752298042105==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add uAPI to query micro-controler firmware version (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123779/">https://patchwork.freedesktop.org/series/123779/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123779v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123779v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63_BAT -&gt; xe-pw-123779v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7488 -&gt; IGT_7490</li>
<li>Linux: xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63 -&gt; xe-pw-123779v2</li>
</ul>
<p>IGT_7488: 099e058c5dfb7a49942edf03cae88a52a77077a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7490: 7490<br />
  xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63: 4a9681392cecd56a372d06b648f7b3a37fdd5c63<br />
  xe-pw-123779v2: 123779v2</p>

</body>
</html>

--===============3677907752298042105==--
