Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EADCD8C9D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 19:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AB010F0D8;
	Thu, 11 Jun 2026 19:19:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7DA10E859;
 Thu, 11 Jun 2026 19:19:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0458524203361276371=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_GuC_paging_engine_support_?=
 =?utf-8?q?=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 19:19:38 -0000
Message-ID: <178120557875.69949.14097554850861573495@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611161634.506476-12-matthew.auld@intel.com>
In-Reply-To: <20260611161634.506476-12-matthew.auld@intel.com>
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

--===============0458524203361276371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: GuC paging engine support (rev6)
URL   : https://patchwork.freedesktop.org/series/166960/
State : success

== Summary ==

CI Bug Log - changes from xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18_BAT -> xe-pw-166960v6_BAT
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

  * Linux: xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18 -> xe-pw-166960v6

  IGT_8959: 77337ca2d2dd470f3b32f1cf4760b0e79a52e2b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18: c0a463345cc689fec0dbdea86cd5729123676e18
  xe-pw-166960v6: 166960v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166960v6/index.html

--===============0458524203361276371==
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
<tr><td><b>Series:</b></td><td>GuC paging engine support (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166960/">https://patchwork.freedesktop.org/series/166960/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166960v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166960v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18_BAT -&gt; xe-pw-166960v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18 -&gt; xe-pw-166960v6</li>
</ul>
<p>IGT_8959: 77337ca2d2dd470f3b32f1cf4760b0e79a52e2b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5242-c0a463345cc689fec0dbdea86cd5729123676e18: c0a463345cc689fec0dbdea86cd5729123676e18<br />
  xe-pw-166960v6: 166960v6</p>

</body>
</html>

--===============0458524203361276371==--
