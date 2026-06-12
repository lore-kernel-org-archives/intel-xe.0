Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ED8CD98CF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 15:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E547F10EA6E;
	Fri, 12 Jun 2026 15:54:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB66310EA6E;
 Fri, 12 Jun 2026 15:54:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4468099220043953555=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_Work_harder_to_?=
 =?utf-8?q?enable_VRR_based_refresh_rate_changes_on_eDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 15:54:42 -0000
Message-ID: <178127968269.74019.4337782040657350440@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612144203.31715-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260612144203.31715-1-ville.syrjala@linux.intel.com>
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

--===============4468099220043953555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Work harder to enable VRR based refresh rate changes on eDP
URL   : https://patchwork.freedesktop.org/series/168442/
State : success

== Summary ==

CI Bug Log - changes from xe-5247-8372c3177e62bca48fdca142601d3d3804ff3129_BAT -> xe-pw-168442v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8960 -> IGT_8961
  * Linux: xe-5247-8372c3177e62bca48fdca142601d3d3804ff3129 -> xe-pw-168442v1

  IGT_8960: 88bd725754990332efcd158b0429f6ac7fb63862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8961: 8961
  xe-5247-8372c3177e62bca48fdca142601d3d3804ff3129: 8372c3177e62bca48fdca142601d3d3804ff3129
  xe-pw-168442v1: 168442v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168442v1/index.html

--===============4468099220043953555==
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
<tr><td><b>Series:</b></td><td>drm/i915: Work harder to enable VRR based refresh rate changes on eDP</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168442/">https://patchwork.freedesktop.org/series/168442/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168442v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168442v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5247-8372c3177e62bca48fdca142601d3d3804ff3129_BAT -&gt; xe-pw-168442v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8960 -&gt; IGT_8961</li>
<li>Linux: xe-5247-8372c3177e62bca48fdca142601d3d3804ff3129 -&gt; xe-pw-168442v1</li>
</ul>
<p>IGT_8960: 88bd725754990332efcd158b0429f6ac7fb63862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8961: 8961<br />
  xe-5247-8372c3177e62bca48fdca142601d3d3804ff3129: 8372c3177e62bca48fdca142601d3d3804ff3129<br />
  xe-pw-168442v1: 168442v1</p>

</body>
</html>

--===============4468099220043953555==--
