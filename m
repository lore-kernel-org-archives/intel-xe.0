Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF5BC44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 11:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F3410E777;
	Tue, 21 Jul 2026 11:17:05 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7866B10E777;
 Tue, 21 Jul 2026 11:17:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4966406150529875439=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Handle_?=
 =?utf-8?q?struct_drm=5Fplane=5Fstate=2Eignore=5Fdamage=5Fclips_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jul 2026 11:17:03 -0000
Message-ID: <178463262348.210834.15289178122141103822@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260721095454.404298-1-tzimmermann@suse.de>
In-Reply-To: <20260721095454.404298-1-tzimmermann@suse.de>
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

--===============4966406150529875439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Handle struct drm_plane_state.ignore_damage_clips (rev3)
URL   : https://patchwork.freedesktop.org/series/169626/
State : success

== Summary ==

CI Bug Log - changes from xe-5445-97aed8a757dcf4d64b13c6387637821a2888586e_BAT -> xe-pw-169626v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5445-97aed8a757dcf4d64b13c6387637821a2888586e -> xe-pw-169626v3

  IGT_9015: c656c9ccd7e45834f4ca191dbf729e7ba4676f6b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5445-97aed8a757dcf4d64b13c6387637821a2888586e: 97aed8a757dcf4d64b13c6387637821a2888586e
  xe-pw-169626v3: 169626v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169626v3/index.html

--===============4966406150529875439==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Handle struct drm_plane_state.ignore_damage_clips (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169626/">https://patchwork.freedesktop.org/series/169626/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169626v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169626v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5445-97aed8a757dcf4d64b13c6387637821a2888586e_BAT -&gt; xe-pw-169626v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5445-97aed8a757dcf4d64b13c6387637821a2888586e -&gt; xe-pw-169626v3</li>
</ul>
<p>IGT_9015: c656c9ccd7e45834f4ca191dbf729e7ba4676f6b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5445-97aed8a757dcf4d64b13c6387637821a2888586e: 97aed8a757dcf4d64b13c6387637821a2888586e<br />
  xe-pw-169626v3: 169626v3</p>

</body>
</html>

--===============4966406150529875439==--
