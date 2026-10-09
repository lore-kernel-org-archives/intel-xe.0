Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B7BCA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 11:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AB1112068;
	Fri,  9 Oct 2026 11:13:50 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4499810E5E4;
 Fri,  9 Oct 2026 11:13:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7493975758370193531=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv4?=
 =?utf-8?q?=2C1/3=5D_gpu/buddy=3A_restore_two-pass_clear/dirty_guard_for_ran?=
 =?utf-8?q?ge-biased_allocation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 11:13:49 -0000
Message-ID: <179154442925.2819.6664534920167635398@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261009100546.1103622-1-arunpravin.paneerselvam@amd.com>
In-Reply-To: <20261009100546.1103622-1-arunpravin.paneerselvam@amd.com>
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

--===============7493975758370193531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v4,1/3] gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation
URL   : https://patchwork.freedesktop.org/series/175825/
State : success

== Summary ==

CI Bug Log - changes from xe-5914-8d1ca30f98be65f4d967bd5a84e3030e3317f6b5_BAT -> xe-pw-175825v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5914-8d1ca30f98be65f4d967bd5a84e3030e3317f6b5 -> xe-pw-175825v1

  IGT_9138: 9138
  xe-5914-8d1ca30f98be65f4d967bd5a84e3030e3317f6b5: 8d1ca30f98be65f4d967bd5a84e3030e3317f6b5
  xe-pw-175825v1: 175825v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175825v1/index.html

--===============7493975758370193531==
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
<tr><td><b>Series:</b></td><td>series starting with [v4,1/3] gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175825/">https://patchwork.freedesktop.org/series/175825/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175825v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175825v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5914-8d1ca30f98be65f4d967bd5a84e3030e3317f6b5_BAT -&gt; xe-pw-175825v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5914-8d1ca30f98be65f4d967bd5a84e3030e3317f6b5 -&gt; xe-pw-175825v1</li>
</ul>
<p>IGT_9138: 9138<br />
  xe-5914-8d1ca30f98be65f4d967bd5a84e3030e3317f6b5: 8d1ca30f98be65f4d967bd5a84e3030e3317f6b5<br />
  xe-pw-175825v1: 175825v1</p>

</body>
</html>

--===============7493975758370193531==--
