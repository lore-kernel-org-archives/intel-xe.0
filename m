Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58B2E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 09:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D48F10E2A3;
	Thu, 19 Dec 2024 09:47:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFD310E2A3;
 Thu, 19 Dec 2024 09:47:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7129674295353789137=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/gsc=3A_Make_GSCCS_disabli?=
 =?utf-8?q?ng_message_less_alarming?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Dec 2024 09:47:08 -0000
Message-ID: <173460162890.372689.14263464455167645078@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219010924.2466333-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241219010924.2466333-1-daniele.ceraolospurio@intel.com>
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

--===============7129674295353789137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gsc: Make GSCCS disabling message less alarming
URL   : https://patchwork.freedesktop.org/series/142811/
State : success

== Summary ==

CI Bug Log - changes from xe-2399-f0dab21571bf17512904e5c395817305acaa351a_BAT -> xe-pw-142811v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2399-f0dab21571bf17512904e5c395817305acaa351a -> xe-pw-142811v1

  IGT_8165: 4d630db8b8cfbccd2b871e5084e5c039c374fb14 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2399-f0dab21571bf17512904e5c395817305acaa351a: f0dab21571bf17512904e5c395817305acaa351a
  xe-pw-142811v1: 142811v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142811v1/index.html

--===============7129674295353789137==
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
<tr><td><b>Series:</b></td><td>drm/xe/gsc: Make GSCCS disabling message less alarming</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142811/">https://patchwork.freedesktop.org/series/142811/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142811v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142811v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2399-f0dab21571bf17512904e5c395817305acaa351a_BAT -&gt; xe-pw-142811v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2399-f0dab21571bf17512904e5c395817305acaa351a -&gt; xe-pw-142811v1</li>
</ul>
<p>IGT_8165: 4d630db8b8cfbccd2b871e5084e5c039c374fb14 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2399-f0dab21571bf17512904e5c395817305acaa351a: f0dab21571bf17512904e5c395817305acaa351a<br />
  xe-pw-142811v1: 142811v1</p>

</body>
</html>

--===============7129674295353789137==--
