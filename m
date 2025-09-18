Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9B4CA1013
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 17:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D616D10E27B;
	Thu, 18 Sep 2025 17:34:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2CE10E27B;
 Thu, 18 Sep 2025 17:34:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0507682650087147862=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Keep_VF_LMEM_B?=
 =?utf-8?q?AR_size_low_if_no_VFs_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Sep 2025 17:34:14 -0000
Message-ID: <175821685436.345924.12150861997072746643@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250918164355.1459200-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250918164355.1459200-1-marcin.bernatowicz@linux.intel.com>
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

--===============0507682650087147862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
URL   : https://patchwork.freedesktop.org/series/154724/
State : success

== Summary ==

CI Bug Log - changes from xe-3792-c1b827f32471e37d88d3016a2a93f88b363f0c8c_BAT -> xe-pw-154724v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3792-c1b827f32471e37d88d3016a2a93f88b363f0c8c -> xe-pw-154724v1

  IGT_8543: 8543
  xe-3792-c1b827f32471e37d88d3016a2a93f88b363f0c8c: c1b827f32471e37d88d3016a2a93f88b363f0c8c
  xe-pw-154724v1: 154724v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154724v1/index.html

--===============0507682650087147862==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154724/">https://patchwork.freedesktop.org/series/154724/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154724v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154724v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3792-c1b827f32471e37d88d3016a2a93f88b363f0c8c_BAT -&gt; xe-pw-154724v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3792-c1b827f32471e37d88d3016a2a93f88b363f0c8c -&gt; xe-pw-154724v1</li>
</ul>
<p>IGT_8543: 8543<br />
  xe-3792-c1b827f32471e37d88d3016a2a93f88b363f0c8c: c1b827f32471e37d88d3016a2a93f88b363f0c8c<br />
  xe-pw-154724v1: 154724v1</p>

</body>
</html>

--===============0507682650087147862==--
