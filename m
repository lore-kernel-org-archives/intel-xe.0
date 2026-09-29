Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC53ACA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 19:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705AE10F055;
	Tue, 29 Sep 2026 19:36:47 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F414010F04A;
 Tue, 29 Sep 2026 19:36:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5064956719469905919=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Elide_clear_on_full_SVM_cop?=
 =?utf-8?q?ies?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Sep 2026 19:36:45 -0000
Message-ID: <179071060599.220833.9127566944459080743@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260929181024.2743854-1-matthew.brost@intel.com>
In-Reply-To: <20260929181024.2743854-1-matthew.brost@intel.com>
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

--===============5064956719469905919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Elide clear on full SVM copies
URL   : https://patchwork.freedesktop.org/series/175238/
State : success

== Summary ==

CI Bug Log - changes from xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2_BAT -> xe-pw-175238v1_BAT
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

  * IGT: IGT_9115 -> IGT_9116
  * Linux: xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2 -> xe-pw-175238v1

  IGT_9115: 9115
  IGT_9116: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2: ecc5a84be849c400af610cdc613a0274e3b101b2
  xe-pw-175238v1: 175238v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175238v1/index.html

--===============5064956719469905919==
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
<tr><td><b>Series:</b></td><td>Elide clear on full SVM copies</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175238/">https://patchwork.freedesktop.org/series/175238/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175238v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175238v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2_BAT -&gt; xe-pw-175238v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9115 -&gt; IGT_9116</li>
<li>Linux: xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2 -&gt; xe-pw-175238v1</li>
</ul>
<p>IGT_9115: 9115<br />
  IGT_9116: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2: ecc5a84be849c400af610cdc613a0274e3b101b2<br />
  xe-pw-175238v1: 175238v1</p>

</body>
</html>

--===============5064956719469905919==--
