Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D341ECD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 19:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EBE10E2BA;
	Thu,  7 May 2026 19:04:33 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B6D10E2BA;
 Thu,  7 May 2026 19:04:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2372736437046267621=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dmc=3A_fix_assert?=
 =?utf-8?q?=5Fdmc=5Floaded_WARN_during_async_firmware_load?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "James Xiong" <james.xiong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 May 2026 19:04:31 -0000
Message-ID: <177818067165.49695.7577654868065316938@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260507164605.608368-1-james.xiong@intel.com>
In-Reply-To: <20260507164605.608368-1-james.xiong@intel.com>
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

--===============2372736437046267621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: fix assert_dmc_loaded WARN during async firmware load
URL   : https://patchwork.freedesktop.org/series/166156/
State : success

== Summary ==

CI Bug Log - changes from xe-5015-13834f1c1c317cff7fe32d24e0630862c3ceafa3_BAT -> xe-pw-166156v1_BAT
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

  * Linux: xe-5015-13834f1c1c317cff7fe32d24e0630862c3ceafa3 -> xe-pw-166156v1

  IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5015-13834f1c1c317cff7fe32d24e0630862c3ceafa3: 13834f1c1c317cff7fe32d24e0630862c3ceafa3
  xe-pw-166156v1: 166156v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v1/index.html

--===============2372736437046267621==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: fix assert_dmc_loaded WARN during async firmware load</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166156/">https://patchwork.freedesktop.org/series/166156/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5015-13834f1c1c317cff7fe32d24e0630862c3ceafa3_BAT -&gt; xe-pw-166156v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5015-13834f1c1c317cff7fe32d24e0630862c3ceafa3 -&gt; xe-pw-166156v1</li>
</ul>
<p>IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5015-13834f1c1c317cff7fe32d24e0630862c3ceafa3: 13834f1c1c317cff7fe32d24e0630862c3ceafa3<br />
  xe-pw-166156v1: 166156v1</p>

</body>
</html>

--===============2372736437046267621==--
