Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60682C54E49
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 13:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B63610F1B9;
	Mon, 26 Feb 2024 13:31:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E547710F1B8;
 Mon, 26 Feb 2024 13:31:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7776265399869027570=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/3=2Cv2?=
 =?utf-8?q?=5D_drm/xe/kunit=3A_fix_link_failure_with_built-in_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 13:31:30 -0000
Message-ID: <170895429093.299440.13646433554678187346@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226124736.1272949-1-arnd@kernel.org>
In-Reply-To: <20240226124736.1272949-1-arnd@kernel.org>
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

--===============7776265399869027570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3,v2] drm/xe/kunit: fix link failure with built-in xe
URL   : https://patchwork.freedesktop.org/series/130384/
State : success

== Summary ==

CI Bug Log - changes from xe-846-da89ab10a9af68bc5bf2da94f0958929042a789d_BAT -> xe-pw-130384v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-846-da89ab10a9af68bc5bf2da94f0958929042a789d -> xe-pw-130384v1

  IGT_7729: 7729
  xe-846-da89ab10a9af68bc5bf2da94f0958929042a789d: da89ab10a9af68bc5bf2da94f0958929042a789d
  xe-pw-130384v1: 130384v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130384v1/index.html

--===============7776265399869027570==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3,v2] drm/xe/kunit: fix link failure with built-in xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130384/">https://patchwork.freedesktop.org/series/130384/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130384v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130384v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-846-da89ab10a9af68bc5bf2da94f0958929042a789d_BAT -&gt; xe-pw-130384v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-846-da89ab10a9af68bc5bf2da94f0958929042a789d -&gt; xe-pw-130384v1</li>
</ul>
<p>IGT_7729: 7729<br />
  xe-846-da89ab10a9af68bc5bf2da94f0958929042a789d: da89ab10a9af68bc5bf2da94f0958929042a789d<br />
  xe-pw-130384v1: 130384v1</p>

</body>
</html>

--===============7776265399869027570==--
