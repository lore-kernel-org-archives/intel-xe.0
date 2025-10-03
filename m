Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D391CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 15:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAC610E13C;
	Fri,  3 Oct 2025 15:23:14 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D48910E126;
 Fri,  3 Oct 2025 15:23:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5655513899642998386=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5BCI?=
 =?utf-8?q?=2C1/2=5D_drm/i915=3A_Disable_tracepoints_for_PREEMPT=5FRT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 Oct 2025 15:23:13 -0000
Message-ID: <175950499356.4125.8241913445341919533@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251003144054.112239-3-dev@lankhorst.se>
In-Reply-To: <20251003144054.112239-3-dev@lankhorst.se>
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

--===============5655513899642998386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/2] drm/i915: Disable tracepoints for PREEMPT_RT
URL   : https://patchwork.freedesktop.org/series/155393/
State : success

== Summary ==

CI Bug Log - changes from xe-3863-fc2ab5b39b79dce447c0e0a0cc9b808618559a37_BAT -> xe-pw-155393v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8572 -> IGT_8573
  * Linux: xe-3863-fc2ab5b39b79dce447c0e0a0cc9b808618559a37 -> xe-pw-155393v1

  IGT_8572: 8572
  IGT_8573: 8573
  xe-3863-fc2ab5b39b79dce447c0e0a0cc9b808618559a37: fc2ab5b39b79dce447c0e0a0cc9b808618559a37
  xe-pw-155393v1: 155393v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155393v1/index.html

--===============5655513899642998386==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/2] drm/i915: Disable tracepoints for PREEMPT_RT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155393/">https://patchwork.freedesktop.org/series/155393/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155393v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155393v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3863-fc2ab5b39b79dce447c0e0a0cc9b808618559a37_BAT -&gt; xe-pw-155393v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8572 -&gt; IGT_8573</li>
<li>Linux: xe-3863-fc2ab5b39b79dce447c0e0a0cc9b808618559a37 -&gt; xe-pw-155393v1</li>
</ul>
<p>IGT_8572: 8572<br />
  IGT_8573: 8573<br />
  xe-3863-fc2ab5b39b79dce447c0e0a0cc9b808618559a37: fc2ab5b39b79dce447c0e0a0cc9b808618559a37<br />
  xe-pw-155393v1: 155393v1</p>

</body>
</html>

--===============5655513899642998386==--
