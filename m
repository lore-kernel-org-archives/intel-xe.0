Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92EDCA5FC1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 19:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9181710F487;
	Wed, 30 Sep 2026 19:28:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7E410F42B;
 Wed, 30 Sep 2026 19:28:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0142813829383107171=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/lrc=3A_Restore_CTX?=
 =?utf-8?q?=5FCS=5FINDIRECT=5FCTX=5FOFFSET_programming_for_ADL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Helen Koike" <koike@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Sep 2026 19:28:48 -0000
Message-ID: <179079652887.225808.893499040334226931@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260930170434.317671-1-koike@igalia.com>
In-Reply-To: <20260930170434.317671-1-koike@igalia.com>
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

--===============0142813829383107171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/lrc: Restore CTX_CS_INDIRECT_CTX_OFFSET programming for ADL
URL   : https://patchwork.freedesktop.org/series/175324/
State : success

== Summary ==

CI Bug Log - changes from xe-5851-71ee29e1a20f63cd880cf336e9dff825d87f025d_BAT -> xe-pw-175324v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5851-71ee29e1a20f63cd880cf336e9dff825d87f025d -> xe-pw-175324v1

  IGT_9118: 26513be3e0f711ed835ec50d5cdcb723ef224105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5851-71ee29e1a20f63cd880cf336e9dff825d87f025d: 71ee29e1a20f63cd880cf336e9dff825d87f025d
  xe-pw-175324v1: 175324v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175324v1/index.html

--===============0142813829383107171==
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
<tr><td><b>Series:</b></td><td>drm/xe/lrc: Restore CTX_CS_INDIRECT_CTX_OFFSET programming for ADL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175324/">https://patchwork.freedesktop.org/series/175324/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175324v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175324v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5851-71ee29e1a20f63cd880cf336e9dff825d87f025d_BAT -&gt; xe-pw-175324v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5851-71ee29e1a20f63cd880cf336e9dff825d87f025d -&gt; xe-pw-175324v1</li>
</ul>
<p>IGT_9118: 26513be3e0f711ed835ec50d5cdcb723ef224105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5851-71ee29e1a20f63cd880cf336e9dff825d87f025d: 71ee29e1a20f63cd880cf336e9dff825d87f025d<br />
  xe-pw-175324v1: 175324v1</p>

</body>
</html>

--===============0142813829383107171==--
