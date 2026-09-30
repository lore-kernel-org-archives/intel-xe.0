Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCD8CA5FBA
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 11:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7433710F2F2;
	Wed, 30 Sep 2026 11:03:59 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FD010F2F5;
 Wed, 30 Sep 2026 11:03:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6083202797346480179=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_ULLS_chained_?=
 =?utf-8?q?job_loss_and_GT_reset_replay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Varun" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Sep 2026 11:03:58 -0000
Message-ID: <179076623841.223335.14861538941438087446@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260930094031.3365707-5-varun.gupta@intel.com>
In-Reply-To: <20260930094031.3365707-5-varun.gupta@intel.com>
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

--===============6083202797346480179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix ULLS chained job loss and GT reset replay
URL   : https://patchwork.freedesktop.org/series/175274/
State : success

== Summary ==

CI Bug Log - changes from xe-5846-f59db4a7bc845221736d574ec8a3bbb117eb23e4_BAT -> xe-pw-175274v1_BAT
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

  * IGT: IGT_9116 -> IGT_9117
  * Linux: xe-5846-f59db4a7bc845221736d574ec8a3bbb117eb23e4 -> xe-pw-175274v1

  IGT_9116: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9117: 9117
  xe-5846-f59db4a7bc845221736d574ec8a3bbb117eb23e4: f59db4a7bc845221736d574ec8a3bbb117eb23e4
  xe-pw-175274v1: 175274v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175274v1/index.html

--===============6083202797346480179==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix ULLS chained job loss and GT reset replay</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175274/">https://patchwork.freedesktop.org/series/175274/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175274v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175274v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5846-f59db4a7bc845221736d574ec8a3bbb117eb23e4_BAT -&gt; xe-pw-175274v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9116 -&gt; IGT_9117</li>
<li>Linux: xe-5846-f59db4a7bc845221736d574ec8a3bbb117eb23e4 -&gt; xe-pw-175274v1</li>
</ul>
<p>IGT_9116: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9117: 9117<br />
  xe-5846-f59db4a7bc845221736d574ec8a3bbb117eb23e4: f59db4a7bc845221736d574ec8a3bbb117eb23e4<br />
  xe-pw-175274v1: 175274v1</p>

</body>
</html>

--===============6083202797346480179==--
