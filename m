Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13461C7EE30
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 15:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59E510E5F8;
	Tue, 24 Jun 2025 15:02:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261CC10E5F5;
 Tue, 24 Jun 2025 15:02:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7634673003369402225=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/display/dp=3A_Use_stati?=
 =?utf-8?q?c_values_for_min=5Fhblank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 15:02:52 -0000
Message-ID: <175077737214.104825.7121018693276524758@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250624-min_hblank-v1-1-5c100e4a8b05@intel.com>
In-Reply-To: <20250624-min_hblank-v1-1-5c100e4a8b05@intel.com>
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

--===============7634673003369402225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/display/dp: Use static values for min_hblank
URL   : https://patchwork.freedesktop.org/series/150680/
State : success

== Summary ==

CI Bug Log - changes from xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201_BAT -> xe-pw-150680v1_BAT
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

  * IGT: IGT_8423 -> IGT_8424
  * Linux: xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201 -> xe-pw-150680v1

  IGT_8423: 8423
  IGT_8424: 68588b3c89a1bbe08c54d21c4d3d2e509957c795 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201: fb5dada21e3cfa26179ca58e1d7c26cdad217201
  xe-pw-150680v1: 150680v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150680v1/index.html

--===============7634673003369402225==
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
<tr><td><b>Series:</b></td><td>drm/display/dp: Use static values for min_hblank</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150680/">https://patchwork.freedesktop.org/series/150680/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150680v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150680v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201_BAT -&gt; xe-pw-150680v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8423 -&gt; IGT_8424</li>
<li>Linux: xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201 -&gt; xe-pw-150680v1</li>
</ul>
<p>IGT_8423: 8423<br />
  IGT_8424: 68588b3c89a1bbe08c54d21c4d3d2e509957c795 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201: fb5dada21e3cfa26179ca58e1d7c26cdad217201<br />
  xe-pw-150680v1: 150680v1</p>

</body>
</html>

--===============7634673003369402225==--
