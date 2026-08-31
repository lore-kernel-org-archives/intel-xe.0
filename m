Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA438C624A4
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 15:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4E010E2EB;
	Mon, 31 Aug 2026 15:26:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF17110E2EB;
 Mon, 31 Aug 2026 15:26:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7735558481765114681=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/sysctrl=3A_Clean_up_?=
 =?utf-8?q?error_handling_in_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 15:26:41 -0000
Message-ID: <178819000197.101634.5332213867065239911@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
In-Reply-To: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
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

--===============7735558481765114681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sysctrl: Clean up error handling in (rev3)
URL   : https://patchwork.freedesktop.org/series/172513/
State : success

== Summary ==

CI Bug Log - changes from xe-5662-aa389a514292b196ae89c6515568b3329abeec63_BAT -> xe-pw-172513v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5662-aa389a514292b196ae89c6515568b3329abeec63 -> xe-pw-172513v3

  IGT_9078: 9078
  xe-5662-aa389a514292b196ae89c6515568b3329abeec63: aa389a514292b196ae89c6515568b3329abeec63
  xe-pw-172513v3: 172513v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v3/index.html

--===============7735558481765114681==
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
<tr><td><b>Series:</b></td><td>drm/xe/sysctrl: Clean up error handling in (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172513/">https://patchwork.freedesktop.org/series/172513/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5662-aa389a514292b196ae89c6515568b3329abeec63_BAT -&gt; xe-pw-172513v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5662-aa389a514292b196ae89c6515568b3329abeec63 -&gt; xe-pw-172513v3</li>
</ul>
<p>IGT_9078: 9078<br />
  xe-5662-aa389a514292b196ae89c6515568b3329abeec63: aa389a514292b196ae89c6515568b3329abeec63<br />
  xe-pw-172513v3: 172513v3</p>

</body>
</html>

--===============7735558481765114681==--
