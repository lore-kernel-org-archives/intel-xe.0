Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838EBC8302B
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 16:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4E510E4A4;
	Mon, 30 Jun 2025 16:17:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314510E4A4;
 Mon, 30 Jun 2025 16:17:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5793401510274379457=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_convert?=
 =?utf-8?q?_to_generic_read=5Fpoll=5Ftimeout=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Jun 2025 16:17:14 -0000
Message-ID: <175130023452.121497.7079923626626342984@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1751023767.git.jani.nikula@intel.com>
In-Reply-To: <cover.1751023767.git.jani.nikula@intel.com>
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

--===============5793401510274379457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: convert to generic read_poll_timeout() (rev2)
URL   : https://patchwork.freedesktop.org/series/150872/
State : success

== Summary ==

CI Bug Log - changes from xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd_BAT -> xe-pw-150872v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd -> xe-pw-150872v2

  IGT_8431: 8431
  xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd: 078be02b4585b9a9703401d89a3ac93e2d15a6bd
  xe-pw-150872v2: 150872v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150872v2/index.html

--===============5793401510274379457==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: convert to generic read_poll_timeout() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150872/">https://patchwork.freedesktop.org/series/150872/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150872v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150872v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd_BAT -&gt; xe-pw-150872v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd -&gt; xe-pw-150872v2</li>
</ul>
<p>IGT_8431: 8431<br />
  xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd: 078be02b4585b9a9703401d89a3ac93e2d15a6bd<br />
  xe-pw-150872v2: 150872v2</p>

</body>
</html>

--===============5793401510274379457==--
