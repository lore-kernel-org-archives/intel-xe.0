Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9B8C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 01:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BBA10E085;
	Tue,  2 Jul 2024 01:01:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625BF10E085;
 Tue,  2 Jul 2024 01:01:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0907993888500477591=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Reapply_=22drm/xe/gsc=3A_define_?=
 =?utf-8?q?GSC_FW_for_LNL=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Jul 2024 01:01:28 -0000
Message-ID: <171988208839.3729.11952250272154489901@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
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

--===============0907993888500477591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Reapply "drm/xe/gsc: define GSC FW for LNL"
URL   : https://patchwork.freedesktop.org/series/135623/
State : success

== Summary ==

CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -> xe-pw-135623v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7907 -> IGT_7908
  * Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -> xe-pw-135623v1

  IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7908: 7908
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299
  xe-pw-135623v1: 135623v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v1/index.html

--===============0907993888500477591==
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
<tr><td><b>Series:</b></td><td>Reapply &quot;drm/xe/gsc: define GSC FW for LNL&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135623/">https://patchwork.freedesktop.org/series/135623/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -&gt; xe-pw-135623v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7907 -&gt; IGT_7908</li>
<li>Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -&gt; xe-pw-135623v1</li>
</ul>
<p>IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7908: 7908<br />
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299<br />
  xe-pw-135623v1: 135623v1</p>

</body>
</html>

--===============0907993888500477591==--
