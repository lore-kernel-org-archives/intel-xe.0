Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A778CC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 06:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733A010E754;
	Tue, 13 Oct 2026 06:19:37 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F5210E745;
 Tue, 13 Oct 2026 06:19:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0780756537681841856=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_FD_close_cleanup_for_XE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Oct 2026 06:19:36 -0000
Message-ID: <179187237673.16050.9808634191009250057@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013023442.206915-1-daniel.charles@intel.com>
In-Reply-To: <20261013023442.206915-1-daniel.charles@intel.com>
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

--===============0780756537681841856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: FD close cleanup for XE
URL   : https://patchwork.freedesktop.org/series/175996/
State : success

== Summary ==

CI Bug Log - changes from xe-5936-882b0f966d25236f00d6ec0c349f7948d2ed1376_BAT -> xe-pw-175996v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5936-882b0f966d25236f00d6ec0c349f7948d2ed1376 -> xe-pw-175996v1

  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5936-882b0f966d25236f00d6ec0c349f7948d2ed1376: 882b0f966d25236f00d6ec0c349f7948d2ed1376
  xe-pw-175996v1: 175996v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v1/index.html

--===============0780756537681841856==
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
<tr><td><b>Series:</b></td><td>FD close cleanup for XE</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175996/">https://patchwork.freedesktop.org/series/175996/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5936-882b0f966d25236f00d6ec0c349f7948d2ed1376_BAT -&gt; xe-pw-175996v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5936-882b0f966d25236f00d6ec0c349f7948d2ed1376 -&gt; xe-pw-175996v1</li>
</ul>
<p>IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5936-882b0f966d25236f00d6ec0c349f7948d2ed1376: 882b0f966d25236f00d6ec0c349f7948d2ed1376<br />
  xe-pw-175996v1: 175996v1</p>

</body>
</html>

--===============0780756537681841856==--
