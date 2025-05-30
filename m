Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6A9C5B549
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 08:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0AE10E7EA;
	Fri, 30 May 2025 08:46:36 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7612A10E7F0;
 Fri, 30 May 2025 08:46:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2020471948394289359=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Make_VMA_tile=5Fp?=
 =?utf-8?q?resent=2C_tile=5Finvalidated_access_rules_clear_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 May 2025 08:46:35 -0000
Message-ID: <174859479547.34389.10077807184997369837@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250530061433.1819041-1-matthew.brost@intel.com>
In-Reply-To: <20250530061433.1819041-1-matthew.brost@intel.com>
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

--===============2020471948394289359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Make VMA tile_present, tile_invalidated access rules clear (rev3)
URL   : https://patchwork.freedesktop.org/series/149676/
State : success

== Summary ==

CI Bug Log - changes from xe-3164-d94defa5c0a9e9fb29a60bd4ce78bac9018224bc_BAT -> xe-pw-149676v3_BAT
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

  * Linux: xe-3164-d94defa5c0a9e9fb29a60bd4ce78bac9018224bc -> xe-pw-149676v3

  IGT_8385: 8385
  xe-3164-d94defa5c0a9e9fb29a60bd4ce78bac9018224bc: d94defa5c0a9e9fb29a60bd4ce78bac9018224bc
  xe-pw-149676v3: 149676v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149676v3/index.html

--===============2020471948394289359==
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
<tr><td><b>Series:</b></td><td>drm/xe: Make VMA tile_present, tile_invalidated access rules clear (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149676/">https://patchwork.freedesktop.org/series/149676/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149676v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149676v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3164-d94defa5c0a9e9fb29a60bd4ce78bac9018224bc_BAT -&gt; xe-pw-149676v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3164-d94defa5c0a9e9fb29a60bd4ce78bac9018224bc -&gt; xe-pw-149676v3</li>
</ul>
<p>IGT_8385: 8385<br />
  xe-3164-d94defa5c0a9e9fb29a60bd4ce78bac9018224bc: d94defa5c0a9e9fb29a60bd4ce78bac9018224bc<br />
  xe-pw-149676v3: 149676v3</p>

</body>
</html>

--===============2020471948394289359==--
