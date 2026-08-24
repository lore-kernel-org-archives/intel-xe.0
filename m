Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0F7C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 21:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA83810E5AB;
	Mon, 24 Aug 2026 21:24:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1025B10E1CD;
 Mon, 24 Aug 2026 21:24:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0479594995900190284=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/ggtt=3A_fix_stale_GG?=
 =?utf-8?q?TT_mappings_on_unmap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Aug 2026 21:24:40 -0000
Message-ID: <178760668005.79853.6180952136578031931@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============0479594995900190284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ggtt: fix stale GGTT mappings on unmap (rev2)
URL   : https://patchwork.freedesktop.org/series/172559/
State : success

== Summary ==

CI Bug Log - changes from xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762_BAT -> xe-pw-172559v2_BAT
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

  * IGT: IGT_9070 -> IGT_9071
  * Linux: xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762 -> xe-pw-172559v2

  IGT_9070: 80b6e4c9b9cb853c63a9bcaa4784e0306d1f7fca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9071: 9071
  xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762: b830d7b865d1dcc0c199feef72cbe7bf7b208762
  xe-pw-172559v2: 172559v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172559v2/index.html

--===============0479594995900190284==
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
<tr><td><b>Series:</b></td><td>drm/xe/ggtt: fix stale GGTT mappings on unmap (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172559/">https://patchwork.freedesktop.org/series/172559/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172559v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172559v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762_BAT -&gt; xe-pw-172559v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9070 -&gt; IGT_9071</li>
<li>Linux: xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762 -&gt; xe-pw-172559v2</li>
</ul>
<p>IGT_9070: 80b6e4c9b9cb853c63a9bcaa4784e0306d1f7fca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9071: 9071<br />
  xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762: b830d7b865d1dcc0c199feef72cbe7bf7b208762<br />
  xe-pw-172559v2: 172559v2</p>

</body>
</html>

--===============0479594995900190284==--
