Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A13C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 22:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4378510E16F;
	Mon,  3 Feb 2025 22:06:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4292C10E16F;
 Mon,  3 Feb 2025 22:06:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6638227047713962012=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dmc=5Fwl=3A_Track_?=
 =?utf-8?q?INITIATE=5FPM=5FDMD=5FREQ_for_DC5?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Feb 2025 22:06:58 -0000
Message-ID: <173862041826.525353.6036193258136793032@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250203205941.251754-1-gustavo.sousa@intel.com>
In-Reply-To: <20250203205941.251754-1-gustavo.sousa@intel.com>
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

--===============6638227047713962012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc_wl: Track INITIATE_PM_DMD_REQ for DC5
URL   : https://patchwork.freedesktop.org/series/144277/
State : success

== Summary ==

CI Bug Log - changes from xe-2587-e4653d321048b16b1373c8ddf0657590963c5897_BAT -> xe-pw-144277v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8220 -> IGT_8221
  * Linux: xe-2587-e4653d321048b16b1373c8ddf0657590963c5897 -> xe-pw-144277v1

  IGT_8220: 8220
  IGT_8221: ad1f57286d15d083b08c94f3d93600db85f9945b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2587-e4653d321048b16b1373c8ddf0657590963c5897: e4653d321048b16b1373c8ddf0657590963c5897
  xe-pw-144277v1: 144277v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144277v1/index.html

--===============6638227047713962012==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc_wl: Track INITIATE_PM_DMD_REQ for DC5</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144277/">https://patchwork.freedesktop.org/series/144277/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144277v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144277v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2587-e4653d321048b16b1373c8ddf0657590963c5897_BAT -&gt; xe-pw-144277v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8220 -&gt; IGT_8221</li>
<li>Linux: xe-2587-e4653d321048b16b1373c8ddf0657590963c5897 -&gt; xe-pw-144277v1</li>
</ul>
<p>IGT_8220: 8220<br />
  IGT_8221: ad1f57286d15d083b08c94f3d93600db85f9945b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2587-e4653d321048b16b1373c8ddf0657590963c5897: e4653d321048b16b1373c8ddf0657590963c5897<br />
  xe-pw-144277v1: 144277v1</p>

</body>
</html>

--===============6638227047713962012==--
