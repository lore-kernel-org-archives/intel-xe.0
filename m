Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97430CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 08:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5221110E405;
	Mon, 13 Oct 2025 08:36:35 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A1610E404;
 Mon, 13 Oct 2025 08:36:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1175054265712521344=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/guc=3A_Eliminate_RP?=
 =?utf-8?q?e_caching_for_SLPC_parameter_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Oct 2025 08:36:34 -0000
Message-ID: <176034459499.4738.13218227708091342676@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013064214.926115-2-sk.anirban@intel.com>
In-Reply-To: <20251013064214.926115-2-sk.anirban@intel.com>
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

--===============1175054265712521344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Eliminate RPe caching for SLPC parameter handling
URL   : https://patchwork.freedesktop.org/series/155809/
State : success

== Summary ==

CI Bug Log - changes from xe-3904-085518a4da5bcf9b68ef798e27ef71d64443aad7_FULL -> xe-pw-155809v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3904-085518a4da5bcf9b68ef798e27ef71d64443aad7 -> xe-pw-155809v1

  IGT_8582: 8582
  xe-3904-085518a4da5bcf9b68ef798e27ef71d64443aad7: 085518a4da5bcf9b68ef798e27ef71d64443aad7
  xe-pw-155809v1: 155809v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v1/index.html

--===============1175054265712521344==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Eliminate RPe caching for SLPC parameter handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155809/">https://patchwork.freedesktop.org/series/155809/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3904-085518a4da5bcf9b68ef798e27ef71d64443aad7_FULL -&gt; xe-pw-155809v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3904-085518a4da5bcf9b68ef798e27ef71d64443aad7 -&gt; xe-pw-155809v1</li>
</ul>
<p>IGT_8582: 8582<br />
  xe-3904-085518a4da5bcf9b68ef798e27ef71d64443aad7: 085518a4da5bcf9b68ef798e27ef71d64443aad7<br />
  xe-pw-155809v1: 155809v1</p>

</body>
</html>

--===============1175054265712521344==--
