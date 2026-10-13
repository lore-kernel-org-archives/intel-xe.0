Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3B6CC6B19
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FC810F9A3;
	Tue, 13 Oct 2026 20:40:49 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B61010F9A3;
 Tue, 13 Oct 2026 20:40:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0396714243466101852=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_kernel_crash_during_dri?=
 =?utf-8?q?ver_teardown_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Oct 2026 20:40:47 -0000
Message-ID: <179192404736.20465.17789661696800927402@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013152417.3189567-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261013152417.3189567-5-satyanarayana.k.v.p@intel.com>
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

--===============0396714243466101852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix kernel crash during driver teardown (rev8)
URL   : https://patchwork.freedesktop.org/series/175766/
State : success

== Summary ==

CI Bug Log - changes from xe-5939-eb1bf4700d3b25a1a1e670ef31cc06969fa08019_BAT -> xe-pw-175766v8_BAT
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

  * IGT: IGT_9142 -> IGT_9143
  * Linux: xe-5939-eb1bf4700d3b25a1a1e670ef31cc06969fa08019 -> xe-pw-175766v8

  IGT_9142: 3d96cd832d6f1dd9625bce109944a31c98fe88f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9143: 992e2bc5d5fcaef292ea89e3db5cb7a50b6edfc2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5939-eb1bf4700d3b25a1a1e670ef31cc06969fa08019: eb1bf4700d3b25a1a1e670ef31cc06969fa08019
  xe-pw-175766v8: 175766v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v8/index.html

--===============0396714243466101852==
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
<tr><td><b>Series:</b></td><td>Fix kernel crash during driver teardown (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175766/">https://patchwork.freedesktop.org/series/175766/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5939-eb1bf4700d3b25a1a1e670ef31cc06969fa08019_BAT -&gt; xe-pw-175766v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9142 -&gt; IGT_9143</li>
<li>Linux: xe-5939-eb1bf4700d3b25a1a1e670ef31cc06969fa08019 -&gt; xe-pw-175766v8</li>
</ul>
<p>IGT_9142: 3d96cd832d6f1dd9625bce109944a31c98fe88f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9143: 992e2bc5d5fcaef292ea89e3db5cb7a50b6edfc2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5939-eb1bf4700d3b25a1a1e670ef31cc06969fa08019: eb1bf4700d3b25a1a1e670ef31cc06969fa08019<br />
  xe-pw-175766v8: 175766v8</p>

</body>
</html>

--===============0396714243466101852==--
