Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A36ECA9EDE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 19:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9B910E474;
	Mon, 12 Oct 2026 19:14:06 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABF810E5B8;
 Mon, 12 Oct 2026 19:14:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8278624759095016834=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe3=3A_Fix_OAM_strea?=
 =?utf-8?q?m_broken_on_Xe3+_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Oct 2026 19:14:06 -0000
Message-ID: <179183244616.14266.5092427330034539366@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261012112158.180251-1-shekhar.chauhan@intel.com>
In-Reply-To: <20261012112158.180251-1-shekhar.chauhan@intel.com>
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

--===============8278624759095016834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3: Fix OAM stream broken on Xe3+ (rev2)
URL   : https://patchwork.freedesktop.org/series/175946/
State : success

== Summary ==

CI Bug Log - changes from xe-5930-9379b5991314afe8e25bcf431c1144aa2b6daa3e_BAT -> xe-pw-175946v2_BAT
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

  * Linux: xe-5930-9379b5991314afe8e25bcf431c1144aa2b6daa3e -> xe-pw-175946v2

  IGT_9139: 3758ada24b618a59d8a5c66e37f0aadc20145d35 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5930-9379b5991314afe8e25bcf431c1144aa2b6daa3e: 9379b5991314afe8e25bcf431c1144aa2b6daa3e
  xe-pw-175946v2: 175946v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175946v2/index.html

--===============8278624759095016834==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3: Fix OAM stream broken on Xe3+ (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175946/">https://patchwork.freedesktop.org/series/175946/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175946v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175946v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5930-9379b5991314afe8e25bcf431c1144aa2b6daa3e_BAT -&gt; xe-pw-175946v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5930-9379b5991314afe8e25bcf431c1144aa2b6daa3e -&gt; xe-pw-175946v2</li>
</ul>
<p>IGT_9139: 3758ada24b618a59d8a5c66e37f0aadc20145d35 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5930-9379b5991314afe8e25bcf431c1144aa2b6daa3e: 9379b5991314afe8e25bcf431c1144aa2b6daa3e<br />
  xe-pw-175946v2: 175946v2</p>

</body>
</html>

--===============8278624759095016834==--
