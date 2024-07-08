Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED09C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 07:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62ADE10E17E;
	Mon,  8 Jul 2024 07:00:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDEE10E17E;
 Mon,  8 Jul 2024 07:00:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0711723789828901762=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Revert_=22drm/i915=3A_?=
 =?utf-8?q?Disable_DSB_in_Xe_KMD=22_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jul 2024 07:00:42 -0000
Message-ID: <172042204296.49182.11356481087424768000@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708055630.4058818-1-animesh.manna@intel.com>
In-Reply-To: <20240708055630.4058818-1-animesh.manna@intel.com>
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

--===============0711723789828901762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Revert "drm/i915: Disable DSB in Xe KMD" (rev4)
URL   : https://patchwork.freedesktop.org/series/131488/
State : success

== Summary ==

CI Bug Log - changes from xe-1569-70f1d41b827fa9d1275748e655912f991635f595_BAT -> xe-pw-131488v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1569-70f1d41b827fa9d1275748e655912f991635f595 -> xe-pw-131488v4

  IGT_7918: aab1a4b6a9b7855fe6e38ea3b3987a1399ee5816 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1569-70f1d41b827fa9d1275748e655912f991635f595: 70f1d41b827fa9d1275748e655912f991635f595
  xe-pw-131488v4: 131488v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v4/index.html

--===============0711723789828901762==
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
<tr><td><b>Series:</b></td><td>drm/xe: Revert &quot;drm/i915: Disable DSB in Xe KMD&quot; (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131488/">https://patchwork.freedesktop.org/series/131488/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1569-70f1d41b827fa9d1275748e655912f991635f595_BAT -&gt; xe-pw-131488v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1569-70f1d41b827fa9d1275748e655912f991635f595 -&gt; xe-pw-131488v4</li>
</ul>
<p>IGT_7918: aab1a4b6a9b7855fe6e38ea3b3987a1399ee5816 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1569-70f1d41b827fa9d1275748e655912f991635f595: 70f1d41b827fa9d1275748e655912f991635f595<br />
  xe-pw-131488v4: 131488v4</p>

</body>
</html>

--===============0711723789828901762==--
