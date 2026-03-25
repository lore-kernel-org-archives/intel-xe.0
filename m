Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8E9109E522
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 22:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F265010E194;
	Wed, 25 Mar 2026 22:10:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5FF10E194;
 Wed, 25 Mar 2026 22:10:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6356961960291336945=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915=3A_Some_fixes_and?=
 =?utf-8?q?_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Mar 2026 22:10:53 -0000
Message-ID: <177447665340.398774.7409015968071407379@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325135849.12603-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260325135849.12603-1-ville.syrjala@linux.intel.com>
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

--===============6356961960291336945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Some fixes and cleanups
URL   : https://patchwork.freedesktop.org/series/163858/
State : success

== Summary ==

CI Bug Log - changes from xe-4781-b62cd8db11ca2928efe6824cc9ea1a0ebbeba302_FULL -> xe-pw-163858v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4781-b62cd8db11ca2928efe6824cc9ea1a0ebbeba302 -> xe-pw-163858v1

  IGT_8825: 531ebe0606453021b88f794aad255d9e1a234d3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4781-b62cd8db11ca2928efe6824cc9ea1a0ebbeba302: b62cd8db11ca2928efe6824cc9ea1a0ebbeba302
  xe-pw-163858v1: 163858v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163858v1/index.html

--===============6356961960291336945==
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
<tr><td><b>Series:</b></td><td>drm/i915: Some fixes and cleanups</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163858/">https://patchwork.freedesktop.org/series/163858/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163858v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163858v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4781-b62cd8db11ca2928efe6824cc9ea1a0ebbeba302_FULL -&gt; xe-pw-163858v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4781-b62cd8db11ca2928efe6824cc9ea1a0ebbeba302 -&gt; xe-pw-163858v1</li>
</ul>
<p>IGT_8825: 531ebe0606453021b88f794aad255d9e1a234d3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4781-b62cd8db11ca2928efe6824cc9ea1a0ebbeba302: b62cd8db11ca2928efe6824cc9ea1a0ebbeba302<br />
  xe-pw-163858v1: 163858v1</p>

</body>
</html>

--===============6356961960291336945==--
