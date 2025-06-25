Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC96FC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 15:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032C510E766;
	Wed, 25 Jun 2025 15:23:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CF610E766;
 Wed, 25 Jun 2025 15:23:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0067634148901713148=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/migrate=3A_make_MI?=
 =?utf-8?q?=5FTLB=5FINVALIDATE_conditional_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Jun 2025 15:23:15 -0000
Message-ID: <175086499542.109144.17620224507201665203@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250620152446.239699-2-matthew.auld@intel.com>
In-Reply-To: <20250620152446.239699-2-matthew.auld@intel.com>
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

--===============0067634148901713148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: make MI_TLB_INVALIDATE conditional (rev3)
URL   : https://patchwork.freedesktop.org/series/150574/
State : success

== Summary ==

CI Bug Log - changes from xe-3303-e4196e8184ee5a9c70c136f659dccef786c263b3_BAT -> xe-pw-150574v3_BAT
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

  * IGT: IGT_8424 -> IGT_8425
  * Linux: xe-3303-e4196e8184ee5a9c70c136f659dccef786c263b3 -> xe-pw-150574v3

  IGT_8424: 68588b3c89a1bbe08c54d21c4d3d2e509957c795 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8425: 8425
  xe-3303-e4196e8184ee5a9c70c136f659dccef786c263b3: e4196e8184ee5a9c70c136f659dccef786c263b3
  xe-pw-150574v3: 150574v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150574v3/index.html

--===============0067634148901713148==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: make MI_TLB_INVALIDATE conditional (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150574/">https://patchwork.freedesktop.org/series/150574/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150574v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150574v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3303-e4196e8184ee5a9c70c136f659dccef786c263b3_BAT -&gt; xe-pw-150574v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8424 -&gt; IGT_8425</li>
<li>Linux: xe-3303-e4196e8184ee5a9c70c136f659dccef786c263b3 -&gt; xe-pw-150574v3</li>
</ul>
<p>IGT_8424: 68588b3c89a1bbe08c54d21c4d3d2e509957c795 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8425: 8425<br />
  xe-3303-e4196e8184ee5a9c70c136f659dccef786c263b3: e4196e8184ee5a9c70c136f659dccef786c263b3<br />
  xe-pw-150574v3: 150574v3</p>

</body>
</html>

--===============0067634148901713148==--
