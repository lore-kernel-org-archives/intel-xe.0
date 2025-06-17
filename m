Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDC8C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 17:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A92710E06D;
	Tue, 17 Jun 2025 17:41:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D782A10E06D;
 Tue, 17 Jun 2025 17:40:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8522247002735515972=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Use_DRM_scheduler_for_delay?=
 =?utf-8?q?ed_GT_TLB_invalidations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Jun 2025 17:40:59 -0000
Message-ID: <175018205987.88665.1105568491041936211@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617153730.2136174-1-matthew.brost@intel.com>
In-Reply-To: <20250617153730.2136174-1-matthew.brost@intel.com>
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

--===============8522247002735515972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use DRM scheduler for delayed GT TLB invalidations
URL   : https://patchwork.freedesktop.org/series/150402/
State : success

== Summary ==

CI Bug Log - changes from xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea_BAT -> xe-pw-150402v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea -> xe-pw-150402v1

  IGT_8413: 8413
  xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea: 9b0a5c52b80dc57862c53abad32ddad241243bea
  xe-pw-150402v1: 150402v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150402v1/index.html

--===============8522247002735515972==
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
<tr><td><b>Series:</b></td><td>Use DRM scheduler for delayed GT TLB invalidations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150402/">https://patchwork.freedesktop.org/series/150402/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150402v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150402v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea_BAT -&gt; xe-pw-150402v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea -&gt; xe-pw-150402v1</li>
</ul>
<p>IGT_8413: 8413<br />
  xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea: 9b0a5c52b80dc57862c53abad32ddad241243bea<br />
  xe-pw-150402v1: 150402v1</p>

</body>
</html>

--===============8522247002735515972==--
