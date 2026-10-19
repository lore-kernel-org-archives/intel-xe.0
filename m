Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B93BCCF2EB
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 14:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0D510EE12;
	Mon, 19 Oct 2026 14:04:17 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1E510EE12;
 Mon, 19 Oct 2026 14:04:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9173700136909911028=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_Display_VT-d_cl?=
 =?utf-8?q?eanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Oct 2026 14:04:17 -0000
Message-ID: <179241865718.41163.16933628220337435534@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
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

--===============9173700136909911028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Display VT-d cleanup
URL   : https://patchwork.freedesktop.org/series/176387/
State : success

== Summary ==

CI Bug Log - changes from xe-5974-1909c1501d5a1c693215ad1cd7bbde41942182eb_BAT -> xe-pw-176387v1_BAT
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

  * Linux: xe-5974-1909c1501d5a1c693215ad1cd7bbde41942182eb -> xe-pw-176387v1

  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5974-1909c1501d5a1c693215ad1cd7bbde41942182eb: 1909c1501d5a1c693215ad1cd7bbde41942182eb
  xe-pw-176387v1: 176387v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176387v1/index.html

--===============9173700136909911028==
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
<tr><td><b>Series:</b></td><td>drm/i915: Display VT-d cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176387/">https://patchwork.freedesktop.org/series/176387/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176387v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176387v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5974-1909c1501d5a1c693215ad1cd7bbde41942182eb_BAT -&gt; xe-pw-176387v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5974-1909c1501d5a1c693215ad1cd7bbde41942182eb -&gt; xe-pw-176387v1</li>
</ul>
<p>IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5974-1909c1501d5a1c693215ad1cd7bbde41942182eb: 1909c1501d5a1c693215ad1cd7bbde41942182eb<br />
  xe-pw-176387v1: 176387v1</p>

</body>
</html>

--===============9173700136909911028==--
