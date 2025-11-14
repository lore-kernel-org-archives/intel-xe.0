Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F24CE7B08
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 13:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587CF10EA71;
	Fri, 14 Nov 2025 13:21:29 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF0A10EA71;
 Fri, 14 Nov 2025 13:21:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8472472248199112567=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Check_for_fenc?=
 =?utf-8?q?e_error_on_VRAM_save/restore?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Nov 2025 13:21:28 -0000
Message-ID: <176312648844.55553.15456977771967342282@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114122339.1791026-1-michal.winiarski@intel.com>
In-Reply-To: <20251114122339.1791026-1-michal.winiarski@intel.com>
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

--===============8472472248199112567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Check for fence error on VRAM save/restore
URL   : https://patchwork.freedesktop.org/series/157579/
State : success

== Summary ==

CI Bug Log - changes from xe-4106-09454f8115d510182b41dd65a887e1eca1bce610_BAT -> xe-pw-157579v1_BAT
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

  * Linux: xe-4106-09454f8115d510182b41dd65a887e1eca1bce610 -> xe-pw-157579v1

  IGT_8623: 8623
  xe-4106-09454f8115d510182b41dd65a887e1eca1bce610: 09454f8115d510182b41dd65a887e1eca1bce610
  xe-pw-157579v1: 157579v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157579v1/index.html

--===============8472472248199112567==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Check for fence error on VRAM save/restore</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157579/">https://patchwork.freedesktop.org/series/157579/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157579v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157579v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4106-09454f8115d510182b41dd65a887e1eca1bce610_BAT -&gt; xe-pw-157579v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4106-09454f8115d510182b41dd65a887e1eca1bce610 -&gt; xe-pw-157579v1</li>
</ul>
<p>IGT_8623: 8623<br />
  xe-4106-09454f8115d510182b41dd65a887e1eca1bce610: 09454f8115d510182b41dd65a887e1eca1bce610<br />
  xe-pw-157579v1: 157579v1</p>

</body>
</html>

--===============8472472248199112567==--
