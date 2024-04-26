Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7546C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 16:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A09610F19A;
	Fri, 26 Apr 2024 16:39:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F8D10F19A;
 Fri, 26 Apr 2024 16:39:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0220067774589620738=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/pf=3A_Implement_pci=5Fdri?=
 =?utf-8?q?ver=2Esriov=5Fconfigure_callback_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Apr 2024 16:39:57 -0000
Message-ID: <171414959733.1687463.9598996069477965636@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240426132217.2351-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240426132217.2351-1-michal.wajdeczko@intel.com>
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

--===============0220067774589620738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Implement pci_driver.sriov_configure callback (rev2)
URL   : https://patchwork.freedesktop.org/series/132868/
State : success

== Summary ==

CI Bug Log - changes from xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778_BAT -> xe-pw-132868v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778 -> xe-pw-132868v2

  IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778: 9eafb9067479e7e797781d93e6a1a6309ac9d778
  xe-pw-132868v2: 132868v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132868v2/index.html

--===============0220067774589620738==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Implement pci_driver.sriov_configure callback (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132868/">https://patchwork.freedesktop.org/series/132868/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132868v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132868v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778_BAT -&gt; xe-pw-132868v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778 -&gt; xe-pw-132868v2</li>
</ul>
<p>IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778: 9eafb9067479e7e797781d93e6a1a6309ac9d778<br />
  xe-pw-132868v2: 132868v2</p>

</body>
</html>

--===============0220067774589620738==--
