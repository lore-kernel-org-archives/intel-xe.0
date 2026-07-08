Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C599CC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 16:31:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF8D10E610;
	Wed,  8 Jul 2026 16:31:12 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F9910E610;
 Wed,  8 Jul 2026 16:31:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5642283307840640026=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/nvm=3A_fix_writable_?=
 =?utf-8?q?override_for_CRI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jul 2026 16:31:10 -0000
Message-ID: <178352827093.165808.9969577409607337388@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260708-cri_nvm_fdo_flip-v1-1-792373667334@intel.com>
In-Reply-To: <20260708-cri_nvm_fdo_flip-v1-1-792373667334@intel.com>
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

--===============5642283307840640026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/nvm: fix writable override for CRI
URL   : https://patchwork.freedesktop.org/series/170015/
State : success

== Summary ==

CI Bug Log - changes from xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d_BAT -> xe-pw-170015v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8992 -> IGT_8993
  * Linux: xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d -> xe-pw-170015v1

  IGT_8992: 1e912fa143a35c4238a1fbcf94443175d8ce1d60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8993: 8993
  xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d: d2b771941e0c8aec7b6648b0c47d81161136944d
  xe-pw-170015v1: 170015v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170015v1/index.html

--===============5642283307840640026==
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
<tr><td><b>Series:</b></td><td>drm/xe/nvm: fix writable override for CRI</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170015/">https://patchwork.freedesktop.org/series/170015/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170015v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170015v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d_BAT -&gt; xe-pw-170015v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8992 -&gt; IGT_8993</li>
<li>Linux: xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d -&gt; xe-pw-170015v1</li>
</ul>
<p>IGT_8992: 1e912fa143a35c4238a1fbcf94443175d8ce1d60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8993: 8993<br />
  xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d: d2b771941e0c8aec7b6648b0c47d81161136944d<br />
  xe-pw-170015v1: 170015v1</p>

</body>
</html>

--===============5642283307840640026==--
