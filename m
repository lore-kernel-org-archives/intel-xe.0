Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28729CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 14:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA98A10E0E5;
	Wed, 27 May 2026 14:45:14 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF65A10E0E5;
 Wed, 27 May 2026 14:45:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4221074614376924815=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBNb3ZlIHhlX3VjX2Z3?=
 =?utf-8?b?X2FiaS5oIHRvIGFiaS8gKHJldjIp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 May 2026 14:45:13 -0000
Message-ID: <177989311370.15289.14014077892634243505@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527112608.22448-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260527112608.22448-1-michal.wajdeczko@intel.com>
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

--===============4221074614376924815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Move xe_uc_fw_abi.h to abi/ (rev2)
URL   : https://patchwork.freedesktop.org/series/167324/
State : success

== Summary ==

CI Bug Log - changes from xe-5136-971288d0e77f7a0d356287121ce549ab5dad570a_BAT -> xe-pw-167324v2_BAT
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

  * Linux: xe-5136-971288d0e77f7a0d356287121ce549ab5dad570a -> xe-pw-167324v2

  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5136-971288d0e77f7a0d356287121ce549ab5dad570a: 971288d0e77f7a0d356287121ce549ab5dad570a
  xe-pw-167324v2: 167324v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167324v2/index.html

--===============4221074614376924815==
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
<tr><td><b>Series:</b></td><td>drm/xe: Move xe_uc_fw_abi.h to abi/ (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167324/">https://patchwork.freedesktop.org/series/167324/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167324v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167324v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5136-971288d0e77f7a0d356287121ce549ab5dad570a_BAT -&gt; xe-pw-167324v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5136-971288d0e77f7a0d356287121ce549ab5dad570a -&gt; xe-pw-167324v2</li>
</ul>
<p>IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5136-971288d0e77f7a0d356287121ce549ab5dad570a: 971288d0e77f7a0d356287121ce549ab5dad570a<br />
  xe-pw-167324v2: 167324v2</p>

</body>
</html>

--===============4221074614376924815==--
