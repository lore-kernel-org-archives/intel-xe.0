Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57E2C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 14:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397E010E51F;
	Fri,  5 Apr 2024 14:58:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5797910EA0C;
 Fri,  5 Apr 2024 14:57:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7611820649980761798=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Update_xe_hwmon_?=
 =?utf-8?q?with_couple_of_fixes_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 14:57:58 -0000
Message-ID: <171232907835.1237482.10699173684919651653@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
In-Reply-To: <20240405130127.1392426-1-karthik.poosa@intel.com>
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

--===============7611820649980761798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Update xe hwmon with couple of fixes (rev7)
URL   : https://patchwork.freedesktop.org/series/131765/
State : success

== Summary ==

CI Bug Log - changes from xe-1046-5714711c6612120bd9c306824ec807d322c0735b_BAT -> xe-pw-131765v7_BAT
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

  * Linux: xe-1046-5714711c6612120bd9c306824ec807d322c0735b -> xe-pw-131765v7

  IGT_7800: 7800
  xe-1046-5714711c6612120bd9c306824ec807d322c0735b: 5714711c6612120bd9c306824ec807d322c0735b
  xe-pw-131765v7: 131765v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v7/index.html

--===============7611820649980761798==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Update xe hwmon with couple of fixes (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131765/">https://patchwork.freedesktop.org/series/131765/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1046-5714711c6612120bd9c306824ec807d322c0735b_BAT -&gt; xe-pw-131765v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1046-5714711c6612120bd9c306824ec807d322c0735b -&gt; xe-pw-131765v7</li>
</ul>
<p>IGT_7800: 7800<br />
  xe-1046-5714711c6612120bd9c306824ec807d322c0735b: 5714711c6612120bd9c306824ec807d322c0735b<br />
  xe-pw-131765v7: 131765v7</p>

</body>
</html>

--===============7611820649980761798==--
