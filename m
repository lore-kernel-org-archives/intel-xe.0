Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5F9C282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 21:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D2D10E06C;
	Fri, 28 Feb 2025 21:37:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E684710E06C;
 Fri, 28 Feb 2025 21:37:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4028100334739626992=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe/vf=3A_Store_the_VF_GuC_version_in_the_compatibility_st?=
 =?utf-8?q?ruct?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 21:37:49 -0000
Message-ID: <174077866994.3295116.434096481816750771@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228200246.3117410-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250228200246.3117410-1-daniele.ceraolospurio@intel.com>
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

--===============4028100334739626992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/vf: Store the VF GuC version in the compatibility struct
URL   : https://patchwork.freedesktop.org/series/145667/
State : success

== Summary ==

CI Bug Log - changes from xe-2736-ca9d01b66c70413a62a1a28fbf8709d2e8440c1c_BAT -> xe-pw-145667v1_BAT
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

  * Linux: xe-2736-ca9d01b66c70413a62a1a28fbf8709d2e8440c1c -> xe-pw-145667v1

  IGT_8255: 4ef742fae97d2f4af680f9e29f7ea45920f939b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2736-ca9d01b66c70413a62a1a28fbf8709d2e8440c1c: ca9d01b66c70413a62a1a28fbf8709d2e8440c1c
  xe-pw-145667v1: 145667v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145667v1/index.html

--===============4028100334739626992==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/vf: Store the VF GuC version in the compatibility struct</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145667/">https://patchwork.freedesktop.org/series/145667/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145667v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145667v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2736-ca9d01b66c70413a62a1a28fbf8709d2e8440c1c_BAT -&gt; xe-pw-145667v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2736-ca9d01b66c70413a62a1a28fbf8709d2e8440c1c -&gt; xe-pw-145667v1</li>
</ul>
<p>IGT_8255: 4ef742fae97d2f4af680f9e29f7ea45920f939b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2736-ca9d01b66c70413a62a1a28fbf8709d2e8440c1c: ca9d01b66c70413a62a1a28fbf8709d2e8440c1c<br />
  xe-pw-145667v1: 145667v1</p>

</body>
</html>

--===============4028100334739626992==--
