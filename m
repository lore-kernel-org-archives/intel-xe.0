Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1B9C369D3
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 13:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B1510E053;
	Tue, 22 Apr 2025 13:31:50 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269CE10E053;
 Tue, 22 Apr 2025 13:31:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6129959528094584451=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/ptl=3A_Extend_GuC_Wa?=
 =?utf-8?q?=5F13011645652?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Apr 2025 13:31:49 -0000
Message-ID: <174532870910.25760.12994514168597789615@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250421221031.1781629-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250421221031.1781629-1-vinay.belgaumkar@intel.com>
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

--===============6129959528094584451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Extend GuC Wa_13011645652
URL   : https://patchwork.freedesktop.org/series/148039/
State : success

== Summary ==

CI Bug Log - changes from xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8_BAT -> xe-pw-148039v1_BAT
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

  * Linux: xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8 -> xe-pw-148039v1

  IGT_8329: 8329
  xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8: 59b03675a8b030e69f6a4927223cd342cb01cea8
  xe-pw-148039v1: 148039v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148039v1/index.html

--===============6129959528094584451==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Extend GuC Wa_13011645652</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148039/">https://patchwork.freedesktop.org/series/148039/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148039v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148039v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8_BAT -&gt; xe-pw-148039v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8 -&gt; xe-pw-148039v1</li>
</ul>
<p>IGT_8329: 8329<br />
  xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8: 59b03675a8b030e69f6a4927223cd342cb01cea8<br />
  xe-pw-148039v1: 148039v1</p>

</body>
</html>

--===============6129959528094584451==--
