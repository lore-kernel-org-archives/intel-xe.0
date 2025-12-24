Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568A0E75445
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 09:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1092110EA60;
	Wed, 24 Dec 2025 09:49:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900CD10EA5F;
 Wed, 24 Dec 2025 09:49:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3427321041813365556=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_LOBF_fixes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Dec 2025 09:49:57 -0000
Message-ID: <176656979758.116263.1421851973539483645@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251224084838.2609537-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251224084838.2609537-1-ankit.k.nautiyal@intel.com>
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

--===============3427321041813365556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: LOBF fixes (rev4)
URL   : https://patchwork.freedesktop.org/series/157554/
State : success

== Summary ==

CI Bug Log - changes from xe-4300-118253beb8169c9de3fa40b47cdf95bee6add3d7_BAT -> xe-pw-157554v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-157554v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4300-118253beb8169c9de3fa40b47cdf95bee6add3d7/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157554v4/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * Linux: xe-4300-118253beb8169c9de3fa40b47cdf95bee6add3d7 -> xe-pw-157554v4

  IGT_8677: 8677
  xe-4300-118253beb8169c9de3fa40b47cdf95bee6add3d7: 118253beb8169c9de3fa40b47cdf95bee6add3d7
  xe-pw-157554v4: 157554v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157554v4/index.html

--===============3427321041813365556==
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
<tr><td><b>Series:</b></td><td>LOBF fixes (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157554/">https://patchwork.freedesktop.org/series/157554/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157554v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157554v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4300-118253beb8169c9de3fa40b47cdf95bee6add3d7_BAT -&gt; xe-pw-157554v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157554v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4300-118253beb8169c9de3fa40b47cdf95bee6add3d7/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157554v4/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4300-118253beb8169c9de3fa40b47cdf95bee6add3d7 -&gt; xe-pw-157554v4</li>
</ul>
<p>IGT_8677: 8677<br />
  xe-4300-118253beb8169c9de3fa40b47cdf95bee6add3d7: 118253beb8169c9de3fa40b47cdf95bee6add3d7<br />
  xe-pw-157554v4: 157554v4</p>

</body>
</html>

--===============3427321041813365556==--
