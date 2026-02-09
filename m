Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B10E94607
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 21:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB21A10E380;
	Mon,  9 Feb 2026 21:19:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FF410E37E;
 Mon,  9 Feb 2026 21:19:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2327296882026890812=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/wa=3A_Steer_RMW_of_M?=
 =?utf-8?q?CR_registers_while_building_default_LRC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Feb 2026 21:19:28 -0000
Message-ID: <177067196834.239393.8450324284305556203@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260206223058.387014-2-matthew.d.roper@intel.com>
In-Reply-To: <20260206223058.387014-2-matthew.d.roper@intel.com>
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

--===============2327296882026890812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/wa: Steer RMW of MCR registers while building default LRC (rev2)
URL   : https://patchwork.freedesktop.org/series/161300/
State : success

== Summary ==

CI Bug Log - changes from xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2_BAT -> xe-pw-161300v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8745 -> IGT_8746
  * Linux: xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2 -> xe-pw-161300v2

  IGT_8745: 8745
  IGT_8746: 8746
  xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2: 5e0595fbb024e9b7e243a7ca8a028f93a37883f2
  xe-pw-161300v2: 161300v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v2/index.html

--===============2327296882026890812==
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
<tr><td><b>Series:</b></td><td>drm/xe/wa: Steer RMW of MCR registers while building default LRC (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161300/">https://patchwork.freedesktop.org/series/161300/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2_BAT -&gt; xe-pw-161300v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8745 -&gt; IGT_8746</li>
<li>Linux: xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2 -&gt; xe-pw-161300v2</li>
</ul>
<p>IGT_8745: 8745<br />
  IGT_8746: 8746<br />
  xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2: 5e0595fbb024e9b7e243a7ca8a028f93a37883f2<br />
  xe-pw-161300v2: 161300v2</p>

</body>
</html>

--===============2327296882026890812==--
