Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9ACE9A04B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 20:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB0110E1E7;
	Tue, 17 Feb 2026 20:55:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89BE10E295;
 Tue, 17 Feb 2026 20:55:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1218356797093696572=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Convert_GT_stats_?=
 =?utf-8?q?to_per-cpu_counters?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Feb 2026 20:55:49 -0000
Message-ID: <177136174992.260823.16169362959878433927@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260217200552.596718-1-matthew.brost@intel.com>
In-Reply-To: <20260217200552.596718-1-matthew.brost@intel.com>
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

--===============1218356797093696572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Convert GT stats to per-cpu counters
URL   : https://patchwork.freedesktop.org/series/161728/
State : success

== Summary ==

CI Bug Log - changes from xe-4569-e66c64e4f12e55cad35c680f1e328a7c7ee92cab_BAT -> xe-pw-161728v1_BAT
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

  * IGT: IGT_8756 -> IGT_8757
  * Linux: xe-4569-e66c64e4f12e55cad35c680f1e328a7c7ee92cab -> xe-pw-161728v1

  IGT_8756: 8756
  IGT_8757: 8757
  xe-4569-e66c64e4f12e55cad35c680f1e328a7c7ee92cab: e66c64e4f12e55cad35c680f1e328a7c7ee92cab
  xe-pw-161728v1: 161728v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161728v1/index.html

--===============1218356797093696572==
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
<tr><td><b>Series:</b></td><td>drm/xe: Convert GT stats to per-cpu counters</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161728/">https://patchwork.freedesktop.org/series/161728/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161728v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161728v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4569-e66c64e4f12e55cad35c680f1e328a7c7ee92cab_BAT -&gt; xe-pw-161728v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8756 -&gt; IGT_8757</li>
<li>Linux: xe-4569-e66c64e4f12e55cad35c680f1e328a7c7ee92cab -&gt; xe-pw-161728v1</li>
</ul>
<p>IGT_8756: 8756<br />
  IGT_8757: 8757<br />
  xe-4569-e66c64e4f12e55cad35c680f1e328a7c7ee92cab: e66c64e4f12e55cad35c680f1e328a7c7ee92cab<br />
  xe-pw-161728v1: 161728v1</p>

</body>
</html>

--===============1218356797093696572==--
