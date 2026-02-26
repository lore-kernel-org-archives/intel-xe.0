Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85613FD8FF5
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 18:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4456210E9CF;
	Thu, 26 Feb 2026 18:49:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEA010E9CF;
 Thu, 26 Feb 2026 18:49:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6823624812624319441=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/compat=3A_Remove_unu?=
 =?utf-8?q?sed_i915=5Freg=2Eh_from_compat_header_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Feb 2026 18:49:23 -0000
Message-ID: <177213176350.291502.11360773905593259043@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260226175531.2324526-1-uma.shankar@intel.com>
In-Reply-To: <20260226175531.2324526-1-uma.shankar@intel.com>
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

--===============6823624812624319441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/compat: Remove unused i915_reg.h from compat header (rev2)
URL   : https://patchwork.freedesktop.org/series/161994/
State : success

== Summary ==

CI Bug Log - changes from xe-4623-85973a6f7a1abd95c0fec01718de5997b88e1885_BAT -> xe-pw-161994v2_BAT
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

  * Linux: xe-4623-85973a6f7a1abd95c0fec01718de5997b88e1885 -> xe-pw-161994v2

  IGT_8773: 8773
  xe-4623-85973a6f7a1abd95c0fec01718de5997b88e1885: 85973a6f7a1abd95c0fec01718de5997b88e1885
  xe-pw-161994v2: 161994v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161994v2/index.html

--===============6823624812624319441==
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
<tr><td><b>Series:</b></td><td>drm/xe/compat: Remove unused i915_reg.h from compat header (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161994/">https://patchwork.freedesktop.org/series/161994/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161994v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161994v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4623-85973a6f7a1abd95c0fec01718de5997b88e1885_BAT -&gt; xe-pw-161994v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4623-85973a6f7a1abd95c0fec01718de5997b88e1885 -&gt; xe-pw-161994v2</li>
</ul>
<p>IGT_8773: 8773<br />
  xe-4623-85973a6f7a1abd95c0fec01718de5997b88e1885: 85973a6f7a1abd95c0fec01718de5997b88e1885<br />
  xe-pw-161994v2: 161994v2</p>

</body>
</html>

--===============6823624812624319441==--
