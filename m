Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13FDC25B78
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 11:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B92110EC85;
	Thu, 16 May 2024 11:50:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320BB10EC7A;
 Thu, 16 May 2024 11:50:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2258856716806509849=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_support_for_VF_to_query_its_?=
 =?utf-8?q?configuration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 May 2024 11:50:07 -0000
Message-ID: <171586020719.2120342.11113173667316790707@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240516110546.2216-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240516110546.2216-1-michal.wajdeczko@intel.com>
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

--===============2258856716806509849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for VF to query its configuration (rev2)
URL   : https://patchwork.freedesktop.org/series/133509/
State : success

== Summary ==

CI Bug Log - changes from xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab_BAT -> xe-pw-133509v2_BAT
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

  * Linux: xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab -> xe-pw-133509v2

  IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab: 3b6a503228b84c010794599203ac3e1e3d349bab
  xe-pw-133509v2: 133509v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/index.html

--===============2258856716806509849==
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
<tr><td><b>Series:</b></td><td>Add support for VF to query its configuration (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133509/">https://patchwork.freedesktop.org/series/133509/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab_BAT -&gt; xe-pw-133509v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab -&gt; xe-pw-133509v2</li>
</ul>
<p>IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab: 3b6a503228b84c010794599203ac3e1e3d349bab<br />
  xe-pw-133509v2: 133509v2</p>

</body>
</html>

--===============2258856716806509849==--
