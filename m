Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE441C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 16:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B8110EB69;
	Fri,  7 Feb 2025 16:17:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A35210EB69;
 Fri,  7 Feb 2025 16:17:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3629024293030882745=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Use_an_explici?=
 =?utf-8?q?t_check_to_see_if_the_device_has_LMTT_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 16:17:14 -0000
Message-ID: <173894503429.2707550.9100406636217079308@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207113111.853821-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250207113111.853821-1-piotr.piorkowski@intel.com>
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

--===============3629024293030882745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Use an explicit check to see if the device has LMTT (rev4)
URL   : https://patchwork.freedesktop.org/series/142212/
State : success

== Summary ==

CI Bug Log - changes from xe-2614-a05904055d959d068edd472132e9e4939888832d_BAT -> xe-pw-142212v4_BAT
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

  * Linux: xe-2614-a05904055d959d068edd472132e9e4939888832d -> xe-pw-142212v4

  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2614-a05904055d959d068edd472132e9e4939888832d: a05904055d959d068edd472132e9e4939888832d
  xe-pw-142212v4: 142212v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/index.html

--===============3629024293030882745==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Use an explicit check to see if the device has LMTT (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142212/">https://patchwork.freedesktop.org/series/142212/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2614-a05904055d959d068edd472132e9e4939888832d_BAT -&gt; xe-pw-142212v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2614-a05904055d959d068edd472132e9e4939888832d -&gt; xe-pw-142212v4</li>
</ul>
<p>IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2614-a05904055d959d068edd472132e9e4939888832d: a05904055d959d068edd472132e9e4939888832d<br />
  xe-pw-142212v4: 142212v4</p>

</body>
</html>

--===============3629024293030882745==--
