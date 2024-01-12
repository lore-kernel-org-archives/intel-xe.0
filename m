Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF66C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 11:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53C310E097;
	Fri, 12 Jan 2024 11:17:50 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B6E10E097;
 Fri, 12 Jan 2024 11:17:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0368016459379709973=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe/guc=3A_Return_CTB_HXG_response_DATA0_if_no_buffer_provided?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Fri, 12 Jan 2024 11:17:48 -0000
Message-ID: <170505826875.332503.11685552931387941651@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112102554.761-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240112102554.761-1-michal.wajdeczko@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0368016459379709973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/guc: Return CTB HXG response DATA0 if no buffer provided
URL   : https://patchwork.freedesktop.org/series/128713/
State : success

== Summary ==

CI Bug Log - changes from xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b_BAT -> xe-pw-128713v1_BAT
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

  * Linux: xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b -> xe-pw-128713v1

  IGT_7671: 7671
  xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b: 10923212b018be3edb1c21b75f432c6cf3f50c6b
  xe-pw-128713v1: 128713v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128713v1/index.html

--===============0368016459379709973==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/guc: Return CTB HXG response DATA0 if no buffer provided</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128713/">https://patchwork.freedesktop.org/series/128713/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128713v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128713v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b_BAT -&gt; xe-pw-128713v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b -&gt; xe-pw-128713v1</li>
</ul>
<p>IGT_7671: 7671<br />
  xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b: 10923212b018be3edb1c21b75f432c6cf3f50c6b<br />
  xe-pw-128713v1: 128713v1</p>

</body>
</html>

--===============0368016459379709973==--
