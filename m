Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C65C4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 23:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406AB10EAC1;
	Wed,  1 May 2024 23:17:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B3C1124A1;
 Wed,  1 May 2024 23:17:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6421844615345260448=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Define_generic_helpers_for_manip?=
 =?utf-8?q?ulating_macro_arguments?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 May 2024 23:17:27 -0000
Message-ID: <171460544792.1793171.3618903888559408961@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240501223221.2395-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240501223221.2395-1-michal.wajdeczko@intel.com>
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

--===============6421844615345260448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Define generic helpers for manipulating macro arguments
URL   : https://patchwork.freedesktop.org/series/133123/
State : success

== Summary ==

CI Bug Log - changes from xe-1215-0c418be899e4476fb09eec9f6693432bcc0c45d1_BAT -> xe-pw-133123v1_BAT
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

  * Linux: xe-1215-0c418be899e4476fb09eec9f6693432bcc0c45d1 -> xe-pw-133123v1

  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1215-0c418be899e4476fb09eec9f6693432bcc0c45d1: 0c418be899e4476fb09eec9f6693432bcc0c45d1
  xe-pw-133123v1: 133123v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133123v1/index.html

--===============6421844615345260448==
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
<tr><td><b>Series:</b></td><td>Define generic helpers for manipulating macro arguments</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133123/">https://patchwork.freedesktop.org/series/133123/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133123v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133123v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1215-0c418be899e4476fb09eec9f6693432bcc0c45d1_BAT -&gt; xe-pw-133123v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1215-0c418be899e4476fb09eec9f6693432bcc0c45d1 -&gt; xe-pw-133123v1</li>
</ul>
<p>IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1215-0c418be899e4476fb09eec9f6693432bcc0c45d1: 0c418be899e4476fb09eec9f6693432bcc0c45d1<br />
  xe-pw-133123v1: 133123v1</p>

</body>
</html>

--===============6421844615345260448==--
