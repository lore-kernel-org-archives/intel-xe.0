Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920A8CAC5BB
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 01:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539A010E75D;
	Thu,  2 Oct 2025 01:44:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AFF10E75D;
 Thu,  2 Oct 2025 01:44:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0008464300646105976=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Flate=5Fbind=5Ff?=
 =?utf-8?q?w=3A_Initialize_uval_variable_in_xe=5Flate=5Fbind=5Ffw=5Fnum=5Ffa?=
 =?utf-8?q?ns=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mallesh.koujalagi@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Oct 2025 01:44:45 -0000
Message-ID: <175936948584.385154.15012433400555317746@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20251002005648.3185636-1-mallesh.koujalagi@intel.com>
In-Reply-To: <20251002005648.3185636-1-mallesh.koujalagi@intel.com>
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

--===============0008464300646105976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_late_bind_fw: Initialize uval variable in xe_late_bind_fw_num_fans() (rev3)
URL   : https://patchwork.freedesktop.org/series/155267/
State : success

== Summary ==

CI Bug Log - changes from xe-3853-5f87abb254011980c8332008cfff72d2cfab4952_BAT -> xe-pw-155267v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3853-5f87abb254011980c8332008cfff72d2cfab4952 -> xe-pw-155267v3

  IGT_8568: 8568
  xe-3853-5f87abb254011980c8332008cfff72d2cfab4952: 5f87abb254011980c8332008cfff72d2cfab4952
  xe-pw-155267v3: 155267v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155267v3/index.html

--===============0008464300646105976==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_late_bind_fw: Initialize uval variable in xe_late_bind_fw_num_fans() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155267/">https://patchwork.freedesktop.org/series/155267/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155267v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155267v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3853-5f87abb254011980c8332008cfff72d2cfab4952_BAT -&gt; xe-pw-155267v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3853-5f87abb254011980c8332008cfff72d2cfab4952 -&gt; xe-pw-155267v3</li>
</ul>
<p>IGT_8568: 8568<br />
  xe-3853-5f87abb254011980c8332008cfff72d2cfab4952: 5f87abb254011980c8332008cfff72d2cfab4952<br />
  xe-pw-155267v3: 155267v3</p>

</body>
</html>

--===============0008464300646105976==--
