Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E4AD6B6A7
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 12:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47C710E2D8;
	Thu, 31 Oct 2024 12:22:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6C510E2D8;
 Thu, 31 Oct 2024 12:22:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1508561684672032544=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_make_all_i91?=
 =?utf-8?q?5=5Fdrv=2Eh_includes_explicit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 12:22:39 -0000
Message-ID: <173037735964.1378613.7967244002119687994@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730374470.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730374470.git.jani.nikula@intel.com>
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

--===============1508561684672032544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: make all i915_drv.h includes explicit
URL   : https://patchwork.freedesktop.org/series/140765/
State : success

== Summary ==

CI Bug Log - changes from xe-2150-d9e9e1b912c1ade4d9a46403c691ff3a13d8caaf_BAT -> xe-pw-140765v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2150-d9e9e1b912c1ade4d9a46403c691ff3a13d8caaf -> xe-pw-140765v1

  IGT_8091: 8091
  xe-2150-d9e9e1b912c1ade4d9a46403c691ff3a13d8caaf: d9e9e1b912c1ade4d9a46403c691ff3a13d8caaf
  xe-pw-140765v1: 140765v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v1/index.html

--===============1508561684672032544==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: make all i915_drv.h includes explicit</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140765/">https://patchwork.freedesktop.org/series/140765/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2150-d9e9e1b912c1ade4d9a46403c691ff3a13d8caaf_BAT -&gt; xe-pw-140765v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2150-d9e9e1b912c1ade4d9a46403c691ff3a13d8caaf -&gt; xe-pw-140765v1</li>
</ul>
<p>IGT_8091: 8091<br />
  xe-2150-d9e9e1b912c1ade4d9a46403c691ff3a13d8caaf: d9e9e1b912c1ade4d9a46403c691ff3a13d8caaf<br />
  xe-pw-140765v1: 140765v1</p>

</body>
</html>

--===============1508561684672032544==--
