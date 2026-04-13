Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C141FE9381C
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 05:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3FC10E028;
	Mon, 13 Apr 2026 05:38:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999F410E028;
 Mon, 13 Apr 2026 05:38:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0516311108662392749=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Unify_fault_injec?=
 =?utf-8?q?tion_hooks_for_CSC=2C_GT_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Apr 2026 05:38:31 -0000
Message-ID: <177605871159.455032.5035992202364252832@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260413045118.548328-2-mallesh.koujalagi@intel.com>
In-Reply-To: <20260413045118.548328-2-mallesh.koujalagi@intel.com>
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

--===============0516311108662392749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Unify fault injection hooks for CSC, GT reset
URL   : https://patchwork.freedesktop.org/series/164761/
State : success

== Summary ==

CI Bug Log - changes from xe-4888-b6fce504bb100219c9b8bb7f719d67c660382f51_BAT -> xe-pw-164761v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4888-b6fce504bb100219c9b8bb7f719d67c660382f51 -> xe-pw-164761v1

  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4888-b6fce504bb100219c9b8bb7f719d67c660382f51: b6fce504bb100219c9b8bb7f719d67c660382f51
  xe-pw-164761v1: 164761v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164761v1/index.html

--===============0516311108662392749==
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
<tr><td><b>Series:</b></td><td>drm/xe: Unify fault injection hooks for CSC, GT reset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164761/">https://patchwork.freedesktop.org/series/164761/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164761v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164761v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4888-b6fce504bb100219c9b8bb7f719d67c660382f51_BAT -&gt; xe-pw-164761v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4888-b6fce504bb100219c9b8bb7f719d67c660382f51 -&gt; xe-pw-164761v1</li>
</ul>
<p>IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4888-b6fce504bb100219c9b8bb7f719d67c660382f51: b6fce504bb100219c9b8bb7f719d67c660382f51<br />
  xe-pw-164761v1: 164761v1</p>

</body>
</html>

--===============0516311108662392749==--
