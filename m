Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0419CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 14:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A5510F20E;
	Thu, 28 May 2026 14:01:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959E210F216;
 Thu, 28 May 2026 14:01:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1078941765515435442=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_fix_LR_TLB_invalidation_gap?=
 =?utf-8?q?s_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 May 2026 14:01:08 -0000
Message-ID: <177997686860.19961.18313759818403505349@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260528124340.1864215-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260528124340.1864215-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============1078941765515435442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fix LR TLB invalidation gaps (rev2)
URL   : https://patchwork.freedesktop.org/series/167262/
State : success

== Summary ==

CI Bug Log - changes from xe-5142-4f554688dffcacf48630c14f9fb77a9f60394c1c_BAT -> xe-pw-167262v2_BAT
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

  * IGT: IGT_8939 -> IGT_8940
  * Linux: xe-5142-4f554688dffcacf48630c14f9fb77a9f60394c1c -> xe-pw-167262v2

  IGT_8939: 8939
  IGT_8940: 656294e257ae4a63e41dbd9d4c11c17ad2543210 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5142-4f554688dffcacf48630c14f9fb77a9f60394c1c: 4f554688dffcacf48630c14f9fb77a9f60394c1c
  xe-pw-167262v2: 167262v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167262v2/index.html

--===============1078941765515435442==
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
<tr><td><b>Series:</b></td><td>fix LR TLB invalidation gaps (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167262/">https://patchwork.freedesktop.org/series/167262/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167262v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167262v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5142-4f554688dffcacf48630c14f9fb77a9f60394c1c_BAT -&gt; xe-pw-167262v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8939 -&gt; IGT_8940</li>
<li>Linux: xe-5142-4f554688dffcacf48630c14f9fb77a9f60394c1c -&gt; xe-pw-167262v2</li>
</ul>
<p>IGT_8939: 8939<br />
  IGT_8940: 656294e257ae4a63e41dbd9d4c11c17ad2543210 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5142-4f554688dffcacf48630c14f9fb77a9f60394c1c: 4f554688dffcacf48630c14f9fb77a9f60394c1c<br />
  xe-pw-167262v2: 167262v2</p>

</body>
</html>

--===============1078941765515435442==--
