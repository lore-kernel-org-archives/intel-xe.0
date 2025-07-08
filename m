Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE52AC83F09
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 16:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976C510E6B2;
	Tue,  8 Jul 2025 16:22:11 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F44810E028;
 Tue,  8 Jul 2025 16:22:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4642095493157999712=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/sched=3A_Allow_drivers_?=
 =?utf-8?q?to_skip_the_reset_with_DRM=5FGPU=5FSCHED=5FSTAT=5FNO=5FHANG_=28re?=
 =?utf-8?q?v4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 16:22:10 -0000
Message-ID: <175199173099.143863.13245356778143139367@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
In-Reply-To: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
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

--===============4642095493157999712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/sched: Allow drivers to skip the reset with DRM_GPU_SCHED_STAT_NO_HANG (rev4)
URL   : https://patchwork.freedesktop.org/series/149696/
State : success

== Summary ==

CI Bug Log - changes from xe-3370-56ce5c21690fd8995ee447f790a15485cb49b996_BAT -> xe-pw-149696v4_BAT
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

  * Linux: xe-3370-56ce5c21690fd8995ee447f790a15485cb49b996 -> xe-pw-149696v4

  IGT_8445: 8445
  xe-3370-56ce5c21690fd8995ee447f790a15485cb49b996: 56ce5c21690fd8995ee447f790a15485cb49b996
  xe-pw-149696v4: 149696v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149696v4/index.html

--===============4642095493157999712==
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
<tr><td><b>Series:</b></td><td>drm/sched: Allow drivers to skip the reset with DRM_GPU_SCHED_STAT_NO_HANG (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149696/">https://patchwork.freedesktop.org/series/149696/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149696v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149696v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3370-56ce5c21690fd8995ee447f790a15485cb49b996_BAT -&gt; xe-pw-149696v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3370-56ce5c21690fd8995ee447f790a15485cb49b996 -&gt; xe-pw-149696v4</li>
</ul>
<p>IGT_8445: 8445<br />
  xe-3370-56ce5c21690fd8995ee447f790a15485cb49b996: 56ce5c21690fd8995ee447f790a15485cb49b996<br />
  xe-pw-149696v4: 149696v4</p>

</body>
</html>

--===============4642095493157999712==--
