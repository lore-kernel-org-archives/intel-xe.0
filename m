Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30471CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 19:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C392210F5A4;
	Thu, 28 May 2026 19:10:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFC010F5A3;
 Thu, 28 May 2026 19:10:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0010063677414228952=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_update_?=
 =?utf-8?q?BW_buddy_initialization_for_LPDDR4_and_LPDDR5?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 May 2026 19:10:50 -0000
Message-ID: <177999545016.21452.8564978619477345665@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260528182601.205595-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260528182601.205595-1-vinod.govindapillai@intel.com>
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

--===============0010063677414228952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: update BW buddy initialization for LPDDR4 and LPDDR5
URL   : https://patchwork.freedesktop.org/series/167480/
State : success

== Summary ==

CI Bug Log - changes from xe-5146-bfaded2f9f87cded1d7a58255e7196b5eb29462e_BAT -> xe-pw-167480v1_BAT
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

  * Linux: xe-5146-bfaded2f9f87cded1d7a58255e7196b5eb29462e -> xe-pw-167480v1

  IGT_8941: 0e365bfe5ccc6d1f7607db10bc21c72d30292cea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5146-bfaded2f9f87cded1d7a58255e7196b5eb29462e: bfaded2f9f87cded1d7a58255e7196b5eb29462e
  xe-pw-167480v1: 167480v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167480v1/index.html

--===============0010063677414228952==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: update BW buddy initialization for LPDDR4 and LPDDR5</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167480/">https://patchwork.freedesktop.org/series/167480/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167480v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167480v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5146-bfaded2f9f87cded1d7a58255e7196b5eb29462e_BAT -&gt; xe-pw-167480v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5146-bfaded2f9f87cded1d7a58255e7196b5eb29462e -&gt; xe-pw-167480v1</li>
</ul>
<p>IGT_8941: 0e365bfe5ccc6d1f7607db10bc21c72d30292cea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5146-bfaded2f9f87cded1d7a58255e7196b5eb29462e: bfaded2f9f87cded1d7a58255e7196b5eb29462e<br />
  xe-pw-167480v1: 167480v1</p>

</body>
</html>

--===============0010063677414228952==--
