Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EAFC19F2E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 14:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4564A10EAFB;
	Thu, 27 Feb 2025 14:07:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B273710EAF6;
 Thu, 27 Feb 2025 14:07:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5627183542737357632=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/vdsc=3A_Use_the_DS?=
 =?utf-8?q?C_config_tables_for_DSI_panels_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 14:07:56 -0000
Message-ID: <174066527672.2713349.3339379853901665166@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227112654.279160-1-suraj.kandpal@intel.com>
In-Reply-To: <20250227112654.279160-1-suraj.kandpal@intel.com>
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

--===============5627183542737357632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vdsc: Use the DSC config tables for DSI panels (rev3)
URL   : https://patchwork.freedesktop.org/series/145560/
State : success

== Summary ==

CI Bug Log - changes from xe-2724-1a52d296ec3278de76f33064361b059a152c3fc3_BAT -> xe-pw-145560v3_BAT
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

  * Linux: xe-2724-1a52d296ec3278de76f33064361b059a152c3fc3 -> xe-pw-145560v3

  IGT_8250: 43a53635da9a5ecb1a9ca189cb15df2c0b78bd38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2724-1a52d296ec3278de76f33064361b059a152c3fc3: 1a52d296ec3278de76f33064361b059a152c3fc3
  xe-pw-145560v3: 145560v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145560v3/index.html

--===============5627183542737357632==
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
<tr><td><b>Series:</b></td><td>drm/i915/vdsc: Use the DSC config tables for DSI panels (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145560/">https://patchwork.freedesktop.org/series/145560/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145560v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145560v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2724-1a52d296ec3278de76f33064361b059a152c3fc3_BAT -&gt; xe-pw-145560v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2724-1a52d296ec3278de76f33064361b059a152c3fc3 -&gt; xe-pw-145560v3</li>
</ul>
<p>IGT_8250: 43a53635da9a5ecb1a9ca189cb15df2c0b78bd38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2724-1a52d296ec3278de76f33064361b059a152c3fc3: 1a52d296ec3278de76f33064361b059a152c3fc3<br />
  xe-pw-145560v3: 145560v3</p>

</body>
</html>

--===============5627183542737357632==--
