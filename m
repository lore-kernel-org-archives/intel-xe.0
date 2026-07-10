Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537EDC43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 12:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC49B10F882;
	Fri, 10 Jul 2026 12:03:36 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43ED10F86B;
 Fri, 10 Jul 2026 12:03:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2884634259088305576=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2Cxe=7D=3A_some?=
 =?utf-8?q?_BIOS_FB_takeover_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Jul 2026 12:03:35 -0000
Message-ID: <178368501566.174566.10614196178322337946@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260710111539.1274555-1-dev@lankhorst.se>
In-Reply-To: <20260710111539.1274555-1-dev@lankhorst.se>
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

--===============2884634259088305576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}: some BIOS FB takeover fixes
URL   : https://patchwork.freedesktop.org/series/170192/
State : success

== Summary ==

CI Bug Log - changes from xe-5381-b9fb5de18ad076d077d7b45a3722cfb468ead956_BAT -> xe-pw-170192v1_BAT
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

  * IGT: IGT_8997 -> IGT_9000
  * Linux: xe-5381-b9fb5de18ad076d077d7b45a3722cfb468ead956 -> xe-pw-170192v1

  IGT_8997: 8997
  IGT_9000: 9000
  xe-5381-b9fb5de18ad076d077d7b45a3722cfb468ead956: b9fb5de18ad076d077d7b45a3722cfb468ead956
  xe-pw-170192v1: 170192v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170192v1/index.html

--===============2884634259088305576==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}: some BIOS FB takeover fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170192/">https://patchwork.freedesktop.org/series/170192/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170192v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170192v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5381-b9fb5de18ad076d077d7b45a3722cfb468ead956_BAT -&gt; xe-pw-170192v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8997 -&gt; IGT_9000</li>
<li>Linux: xe-5381-b9fb5de18ad076d077d7b45a3722cfb468ead956 -&gt; xe-pw-170192v1</li>
</ul>
<p>IGT_8997: 8997<br />
  IGT_9000: 9000<br />
  xe-5381-b9fb5de18ad076d077d7b45a3722cfb468ead956: b9fb5de18ad076d077d7b45a3722cfb468ead956<br />
  xe-pw-170192v1: 170192v1</p>

</body>
</html>

--===============2884634259088305576==--
