Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D711DCA1009
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 19:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9679710EAE4;
	Fri, 30 Aug 2024 19:17:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7695310EAE4;
 Fri, 30 Aug 2024 19:17:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7987245496256677368=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe=3A_Add_missing_runtime_reference_to_wedged_upon_gt=5Freset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 19:17:28 -0000
Message-ID: <172504544848.855707.5264673837398485331@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240830183507.298351-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240830183507.298351-1-rodrigo.vivi@intel.com>
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

--===============7987245496256677368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Add missing runtime reference to wedged upon gt_reset
URL   : https://patchwork.freedesktop.org/series/138032/
State : success

== Summary ==

CI Bug Log - changes from xe-1870-f4ff02939d3dbc543467ee4501fd5e7a705de05b_BAT -> xe-pw-138032v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1870-f4ff02939d3dbc543467ee4501fd5e7a705de05b -> xe-pw-138032v1

  IGT_8000: fba44baafa5d79b6eed52fa24234781e8e47beb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1870-f4ff02939d3dbc543467ee4501fd5e7a705de05b: f4ff02939d3dbc543467ee4501fd5e7a705de05b
  xe-pw-138032v1: 138032v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138032v1/index.html

--===============7987245496256677368==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Add missing runtime reference to wedged upon gt_reset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138032/">https://patchwork.freedesktop.org/series/138032/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138032v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138032v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1870-f4ff02939d3dbc543467ee4501fd5e7a705de05b_BAT -&gt; xe-pw-138032v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1870-f4ff02939d3dbc543467ee4501fd5e7a705de05b -&gt; xe-pw-138032v1</li>
</ul>
<p>IGT_8000: fba44baafa5d79b6eed52fa24234781e8e47beb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1870-f4ff02939d3dbc543467ee4501fd5e7a705de05b: f4ff02939d3dbc543467ee4501fd5e7a705de05b<br />
  xe-pw-138032v1: 138032v1</p>

</body>
</html>

--===============7987245496256677368==--
