Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97749CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 03:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5722E10E05C;
	Wed, 20 May 2026 03:27:14 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07AE10E05C;
 Wed, 20 May 2026 03:27:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7746710227257916295=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/hdmi=3A_Poll_for_2?=
 =?utf-8?q?00_msec_for_TMDS=5FScrambler=5FStatus_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 May 2026 03:27:12 -0000
Message-ID: <177924763283.88513.146038313771717250@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
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

--===============7746710227257916295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdmi: Poll for 200 msec for TMDS_Scrambler_Status (rev3)
URL   : https://patchwork.freedesktop.org/series/160027/
State : success

== Summary ==

CI Bug Log - changes from xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe_BAT -> xe-pw-160027v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-lnl-1 bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8921 -> IGT_8922
  * Linux: xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe -> xe-pw-160027v3

  IGT_8921: 8921
  IGT_8922: 8922
  xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe: 81e61a51364beae8f6e63a2d89c776a6b4b323fe
  xe-pw-160027v3: 160027v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160027v3/index.html

--===============7746710227257916295==
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
<tr><td><b>Series:</b></td><td>drm/i915/hdmi: Poll for 200 msec for TMDS_Scrambler_Status (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160027/">https://patchwork.freedesktop.org/series/160027/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160027v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160027v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe_BAT -&gt; xe-pw-160027v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-lnl-1 bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8921 -&gt; IGT_8922</li>
<li>Linux: xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe -&gt; xe-pw-160027v3</li>
</ul>
<p>IGT_8921: 8921<br />
  IGT_8922: 8922<br />
  xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe: 81e61a51364beae8f6e63a2d89c776a6b4b323fe<br />
  xe-pw-160027v3: 160027v3</p>

</body>
</html>

--===============7746710227257916295==--
