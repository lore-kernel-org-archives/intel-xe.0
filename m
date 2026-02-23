Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD5FE98DFA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 07:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0037F10E262;
	Mon, 23 Feb 2026 07:55:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8924B10E26F;
 Mon, 23 Feb 2026 07:55:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7309390015180328140=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_Fix_color_blob_?=
 =?utf-8?q?reference_handling_in_intel=5Fplane=5Fstate?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Feb 2026 07:55:20 -0000
Message-ID: <177183332054.273936.13507591396079955830@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223064708.540934-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260223064708.540934-1-chaitanya.kumar.borah@intel.com>
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

--===============7309390015180328140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Fix color blob reference handling in intel_plane_state
URL   : https://patchwork.freedesktop.org/series/161940/
State : success

== Summary ==

CI Bug Log - changes from xe-4587-05fc8dd26df5c1cae18b1d5b9de791a9a332433c_BAT -> xe-pw-161940v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4587-05fc8dd26df5c1cae18b1d5b9de791a9a332433c -> xe-pw-161940v1

  IGT_8765: 8765
  xe-4587-05fc8dd26df5c1cae18b1d5b9de791a9a332433c: 05fc8dd26df5c1cae18b1d5b9de791a9a332433c
  xe-pw-161940v1: 161940v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161940v1/index.html

--===============7309390015180328140==
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
<tr><td><b>Series:</b></td><td>drm/i915: Fix color blob reference handling in intel_plane_state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161940/">https://patchwork.freedesktop.org/series/161940/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161940v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161940v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4587-05fc8dd26df5c1cae18b1d5b9de791a9a332433c_BAT -&gt; xe-pw-161940v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4587-05fc8dd26df5c1cae18b1d5b9de791a9a332433c -&gt; xe-pw-161940v1</li>
</ul>
<p>IGT_8765: 8765<br />
  xe-4587-05fc8dd26df5c1cae18b1d5b9de791a9a332433c: 05fc8dd26df5c1cae18b1d5b9de791a9a332433c<br />
  xe-pw-161940v1: 161940v1</p>

</body>
</html>

--===============7309390015180328140==--
