Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F59CD3445
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 17:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF47C10E365;
	Sat,  9 May 2026 17:50:02 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B798610E365;
 Sat,  9 May 2026 17:50:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8970436294100226391=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_casf_=26_scaler_refactoring?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 May 2026 17:50:00 -0000
Message-ID: <177834900073.54794.4196642224217243016@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260509164048.627399-1-michal.grzelak@intel.com>
In-Reply-To: <20260509164048.627399-1-michal.grzelak@intel.com>
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

--===============8970436294100226391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: casf & scaler refactoring
URL   : https://patchwork.freedesktop.org/series/166252/
State : success

== Summary ==

CI Bug Log - changes from xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773_BAT -> xe-pw-166252v1_BAT
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

  * IGT: IGT_8901 -> IGT_8902
  * Linux: xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773 -> xe-pw-166252v1

  IGT_8901: 0a391e6b79fd6c6c7a55f75ea4769f31529821c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773: 11d2d2a0077bf9aef71906f0db84bdab357ac773
  xe-pw-166252v1: 166252v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/index.html

--===============8970436294100226391==
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
<tr><td><b>Series:</b></td><td>casf &amp; scaler refactoring</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166252/">https://patchwork.freedesktop.org/series/166252/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773_BAT -&gt; xe-pw-166252v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8901 -&gt; IGT_8902</li>
<li>Linux: xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773 -&gt; xe-pw-166252v1</li>
</ul>
<p>IGT_8901: 0a391e6b79fd6c6c7a55f75ea4769f31529821c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773: 11d2d2a0077bf9aef71906f0db84bdab357ac773<br />
  xe-pw-166252v1: 166252v1</p>

</body>
</html>

--===============8970436294100226391==--
