Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9D6FF886F
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 12:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03E210E0BA;
	Mon,  4 May 2026 12:52:04 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9138A10E0BA;
 Mon,  4 May 2026 12:52:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5075294656985054152=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_enable_sampler_LD?=
 =?utf-8?q?_on_LSC_control_via_render_surface_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 May 2026 12:52:03 -0000
Message-ID: <177789912358.33916.9873881681230465525@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504100511.146844-1-tapani.palli@intel.com>
In-Reply-To: <20260504100511.146844-1-tapani.palli@intel.com>
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

--===============5075294656985054152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: enable sampler LD on LSC control via render surface state
URL   : https://patchwork.freedesktop.org/series/165887/
State : success

== Summary ==

CI Bug Log - changes from xe-4974-13d65adb8b8d196f30ae4b3eb51a2ad29e965195_BAT -> xe-pw-165887v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4974-13d65adb8b8d196f30ae4b3eb51a2ad29e965195 -> xe-pw-165887v1

  IGT_8882: 3ef61dd87d23e6c8d7956b5a72ba01a6597a3fd1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4974-13d65adb8b8d196f30ae4b3eb51a2ad29e965195: 13d65adb8b8d196f30ae4b3eb51a2ad29e965195
  xe-pw-165887v1: 165887v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165887v1/index.html

--===============5075294656985054152==
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
<tr><td><b>Series:</b></td><td>drm/xe: enable sampler LD on LSC control via render surface state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165887/">https://patchwork.freedesktop.org/series/165887/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165887v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165887v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4974-13d65adb8b8d196f30ae4b3eb51a2ad29e965195_BAT -&gt; xe-pw-165887v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4974-13d65adb8b8d196f30ae4b3eb51a2ad29e965195 -&gt; xe-pw-165887v1</li>
</ul>
<p>IGT_8882: 3ef61dd87d23e6c8d7956b5a72ba01a6597a3fd1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4974-13d65adb8b8d196f30ae4b3eb51a2ad29e965195: 13d65adb8b8d196f30ae4b3eb51a2ad29e965195<br />
  xe-pw-165887v1: 165887v1</p>

</body>
</html>

--===============5075294656985054152==--
