Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD4EC5DF87
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 12:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1157F10E150;
	Wed, 19 Aug 2026 12:33:59 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C26510E150;
 Wed, 19 Aug 2026 12:33:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2911056022184465437=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pci=5Ferror=3A_Allow?=
 =?utf-8?q?_debugging_PCI_errors_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Aug 2026 12:33:57 -0000
Message-ID: <178714283756.67510.6184868150164563564@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260819113519.510853-1-raag.jadav@intel.com>
In-Reply-To: <20260819113519.510853-1-raag.jadav@intel.com>
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

--===============2911056022184465437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pci_error: Allow debugging PCI errors (rev4)
URL   : https://patchwork.freedesktop.org/series/172226/
State : success

== Summary ==

CI Bug Log - changes from xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c_BAT -> xe-pw-172226v4_BAT
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

  * IGT: IGT_9060 -> IGT_9061
  * Linux: xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c -> xe-pw-172226v4

  IGT_9060: 9060
  IGT_9061: 9061
  xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c: 291141d363710c4ac7ef9ab71153459d746ed50c
  xe-pw-172226v4: 172226v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/index.html

--===============2911056022184465437==
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
<tr><td><b>Series:</b></td><td>drm/xe/pci_error: Allow debugging PCI errors (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172226/">https://patchwork.freedesktop.org/series/172226/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c_BAT -&gt; xe-pw-172226v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9060 -&gt; IGT_9061</li>
<li>Linux: xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c -&gt; xe-pw-172226v4</li>
</ul>
<p>IGT_9060: 9060<br />
  IGT_9061: 9061<br />
  xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c: 291141d363710c4ac7ef9ab71153459d746ed50c<br />
  xe-pw-172226v4: 172226v4</p>

</body>
</html>

--===============2911056022184465437==--
