Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74678E94133
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 21:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C47110E575;
	Fri,  6 Oct 2023 21:58:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E518F10E575;
 Fri,  6 Oct 2023 21:58:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DB04DAADD6;
 Fri,  6 Oct 2023 21:58:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8037779221070374675=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Fri, 06 Oct 2023 21:58:02 -0000
Message-ID: <169662948285.6465.1206426058887108199@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231006191939.78251-1-jose.souza@intel.com>
In-Reply-To: <20231006191939.78251-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Add_INSTDONE_register_to_devcoredump?=
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

--===============8037779221070374675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add INSTDONE register to devcoredump
URL   : https://patchwork.freedesktop.org/series/124746/
State : success

== Summary ==

CI Bug Log - changes from xe-419-d4af396a232e87d1febbc0e8832ae03bb3ecc4ea_BAT -> xe-pw-124746v1_BAT
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

  * Linux: xe-419-d4af396a232e87d1febbc0e8832ae03bb3ecc4ea -> xe-pw-124746v1

  IGT_7519: d1db7333d9c5fbbb05e50b0804123950d9dc1c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-419-d4af396a232e87d1febbc0e8832ae03bb3ecc4ea: d4af396a232e87d1febbc0e8832ae03bb3ecc4ea
  xe-pw-124746v1: 124746v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124746v1/index.html

--===============8037779221070374675==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add INSTDONE register to devcoredump</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124746/">https://patchwork.freedesktop.org/series/124746/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124746v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124746v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-419-d4af396a232e87d1febbc0e8832ae03bb3ecc4ea_BAT -&gt; xe-pw-124746v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-419-d4af396a232e87d1febbc0e8832ae03bb3ecc4ea -&gt; xe-pw-124746v1</li>
</ul>
<p>IGT_7519: d1db7333d9c5fbbb05e50b0804123950d9dc1c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-419-d4af396a232e87d1febbc0e8832ae03bb3ecc4ea: d4af396a232e87d1febbc0e8832ae03bb3ecc4ea<br />
  xe-pw-124746v1: 124746v1</p>

</body>
</html>

--===============8037779221070374675==--
