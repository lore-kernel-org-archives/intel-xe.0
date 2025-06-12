Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76615C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 09:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3182110E7CA;
	Thu, 12 Jun 2025 09:58:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A18110E4B0;
 Thu, 12 Jun 2025 09:58:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5064289042665405012=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/gmbus=3A_Add_Wa=5F?=
 =?utf-8?q?16025573575_for_PTL_for_bit-bashing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 09:58:17 -0000
Message-ID: <174972229723.70743.6854772818443839717@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612075330.837179-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250612075330.837179-1-ankit.k.nautiyal@intel.com>
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

--===============5064289042665405012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gmbus: Add Wa_16025573575 for PTL for bit-bashing
URL   : https://patchwork.freedesktop.org/series/150136/
State : success

== Summary ==

CI Bug Log - changes from xe-3237-75238c32deae15ee4120b42a5be556ec36807a84_BAT -> xe-pw-150136v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3237-75238c32deae15ee4120b42a5be556ec36807a84 -> xe-pw-150136v1

  IGT_8405: 8405
  xe-3237-75238c32deae15ee4120b42a5be556ec36807a84: 75238c32deae15ee4120b42a5be556ec36807a84
  xe-pw-150136v1: 150136v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150136v1/index.html

--===============5064289042665405012==
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
<tr><td><b>Series:</b></td><td>drm/i915/gmbus: Add Wa_16025573575 for PTL for bit-bashing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150136/">https://patchwork.freedesktop.org/series/150136/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150136v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150136v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3237-75238c32deae15ee4120b42a5be556ec36807a84_BAT -&gt; xe-pw-150136v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3237-75238c32deae15ee4120b42a5be556ec36807a84 -&gt; xe-pw-150136v1</li>
</ul>
<p>IGT_8405: 8405<br />
  xe-3237-75238c32deae15ee4120b42a5be556ec36807a84: 75238c32deae15ee4120b42a5be556ec36807a84<br />
  xe-pw-150136v1: 150136v1</p>

</body>
</html>

--===============5064289042665405012==--
