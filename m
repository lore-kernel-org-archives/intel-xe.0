Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB8ECCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 16:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BF410E94B;
	Thu,  6 Nov 2025 16:25:37 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2415110E94B;
 Thu,  6 Nov 2025 16:25:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8688283741226863844=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL2k5MTU6IFN0b3AgdGhlIGlu?=
 =?utf-8?b?dGVsX2RlX3dhaXRfY3VzdG9tKCkgYWJ1c2UgKHJldjIp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Nov 2025 16:25:37 -0000
Message-ID: <176244633713.25862.16194223755285741992@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251106152049.21115-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251106152049.21115-1-ville.syrjala@linux.intel.com>
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

--===============8688283741226863844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Stop the intel_de_wait_custom() abuse (rev2)
URL   : https://patchwork.freedesktop.org/series/157098/
State : success

== Summary ==

CI Bug Log - changes from xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad_BAT -> xe-pw-157098v2_BAT
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

  * IGT: IGT_8612 -> IGT_8613
  * Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -> xe-pw-157098v2

  IGT_8612: 8612
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad
  xe-pw-157098v2: 157098v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157098v2/index.html

--===============8688283741226863844==
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
<tr><td><b>Series:</b></td><td>drm/i915: Stop the intel_de_wait_custom() abuse (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157098/">https://patchwork.freedesktop.org/series/157098/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157098v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157098v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad_BAT -&gt; xe-pw-157098v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8612 -&gt; IGT_8613</li>
<li>Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -&gt; xe-pw-157098v2</li>
</ul>
<p>IGT_8612: 8612<br />
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad<br />
  xe-pw-157098v2: 157098v2</p>

</body>
</html>

--===============8688283741226863844==--
