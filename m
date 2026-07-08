Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38877C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 09:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC19010E5A0;
	Wed,  8 Jul 2026 09:57:14 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA8410E5A0;
 Wed,  8 Jul 2026 09:57:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0939754513465725935=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dmc=3A_Enable_PIPE?=
 =?utf-8?q?DMC=5FERROR_interrupt_on_display_version_30+_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jul 2026 09:57:13 -0000
Message-ID: <178350463365.164223.15770802485124277575@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260708090712.3800170-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260708090712.3800170-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============0939754513465725935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Enable PIPEDMC_ERROR interrupt on display version 30+ (rev2)
URL   : https://patchwork.freedesktop.org/series/169877/
State : success

== Summary ==

CI Bug Log - changes from xe-5364-331949b3b9225375d72a6402cf94b5d6c6621d1c_BAT -> xe-pw-169877v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8991 -> IGT_8992
  * Linux: xe-5364-331949b3b9225375d72a6402cf94b5d6c6621d1c -> xe-pw-169877v2

  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8992: 1e912fa143a35c4238a1fbcf94443175d8ce1d60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5364-331949b3b9225375d72a6402cf94b5d6c6621d1c: 331949b3b9225375d72a6402cf94b5d6c6621d1c
  xe-pw-169877v2: 169877v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169877v2/index.html

--===============0939754513465725935==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Enable PIPEDMC_ERROR interrupt on display version 30+ (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169877/">https://patchwork.freedesktop.org/series/169877/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169877v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169877v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5364-331949b3b9225375d72a6402cf94b5d6c6621d1c_BAT -&gt; xe-pw-169877v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8991 -&gt; IGT_8992</li>
<li>Linux: xe-5364-331949b3b9225375d72a6402cf94b5d6c6621d1c -&gt; xe-pw-169877v2</li>
</ul>
<p>IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8992: 1e912fa143a35c4238a1fbcf94443175d8ce1d60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5364-331949b3b9225375d72a6402cf94b5d6c6621d1c: 331949b3b9225375d72a6402cf94b5d6c6621d1c<br />
  xe-pw-169877v2: 169877v2</p>

</body>
</html>

--===============0939754513465725935==--
