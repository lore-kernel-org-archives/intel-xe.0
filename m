Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44C0C624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 14:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8178910E704;
	Mon, 31 Aug 2026 14:48:32 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BA410E704;
 Mon, 31 Aug 2026 14:48:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4753215607350306799=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Retry_GuC_stat?=
 =?utf-8?q?e_reset_until_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 14:48:31 -0000
Message-ID: <178818771109.101634.3142070286905343365@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831092118.488317-1-lukasz.laguna@intel.com>
In-Reply-To: <20260831092118.488317-1-lukasz.laguna@intel.com>
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

--===============4753215607350306799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Retry GuC state reset until timeout
URL   : https://patchwork.freedesktop.org/series/173046/
State : success

== Summary ==

CI Bug Log - changes from xe-5662-aa389a514292b196ae89c6515568b3329abeec63_BAT -> xe-pw-173046v1_BAT
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

  * Linux: xe-5662-aa389a514292b196ae89c6515568b3329abeec63 -> xe-pw-173046v1

  IGT_9078: 9078
  xe-5662-aa389a514292b196ae89c6515568b3329abeec63: aa389a514292b196ae89c6515568b3329abeec63
  xe-pw-173046v1: 173046v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/index.html

--===============4753215607350306799==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Retry GuC state reset until timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173046/">https://patchwork.freedesktop.org/series/173046/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5662-aa389a514292b196ae89c6515568b3329abeec63_BAT -&gt; xe-pw-173046v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5662-aa389a514292b196ae89c6515568b3329abeec63 -&gt; xe-pw-173046v1</li>
</ul>
<p>IGT_9078: 9078<br />
  xe-5662-aa389a514292b196ae89c6515568b3329abeec63: aa389a514292b196ae89c6515568b3329abeec63<br />
  xe-pw-173046v1: 173046v1</p>

</body>
</html>

--===============4753215607350306799==--
