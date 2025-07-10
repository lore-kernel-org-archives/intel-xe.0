Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B69C83F09
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 06:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C8B10E879;
	Thu, 10 Jul 2025 06:26:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5DB10E879;
 Thu, 10 Jul 2025 06:26:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6113772019281836459=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Revert_patch_to_reject_HBR3?=
 =?utf-8?q?_for_all_eDP_panels_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 06:26:53 -0000
Message-ID: <175212881311.149725.367004516553040083@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710052041.1238567-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250710052041.1238567-1-ankit.k.nautiyal@intel.com>
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

--===============6113772019281836459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert patch to reject HBR3 for all eDP panels (rev6)
URL   : https://patchwork.freedesktop.org/series/150568/
State : success

== Summary ==

CI Bug Log - changes from xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0_BAT -> xe-pw-150568v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8447 -> IGT_8448
  * Linux: xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0 -> xe-pw-150568v6

  IGT_8447: 8447
  IGT_8448: 8448
  xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0: 7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0
  xe-pw-150568v6: 150568v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v6/index.html

--===============6113772019281836459==
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
<tr><td><b>Series:</b></td><td>Revert patch to reject HBR3 for all eDP panels (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150568/">https://patchwork.freedesktop.org/series/150568/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0_BAT -&gt; xe-pw-150568v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8447 -&gt; IGT_8448</li>
<li>Linux: xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0 -&gt; xe-pw-150568v6</li>
</ul>
<p>IGT_8447: 8447<br />
  IGT_8448: 8448<br />
  xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0: 7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0<br />
  xe-pw-150568v6: 150568v6</p>

</body>
</html>

--===============6113772019281836459==--
