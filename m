Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BAFC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 08:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FC210E317;
	Tue, 21 May 2024 08:03:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA3D10E317;
 Tue, 21 May 2024 08:03:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5949249990702610544=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_TTM_shrinker_helpers_and_xe_buff?=
 =?utf-8?q?er_object_shrinker_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 08:03:12 -0000
Message-ID: <171627859276.2162156.5704054788845481992@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
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

--===============5949249990702610544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: TTM shrinker helpers and xe buffer object shrinker (rev3)
URL   : https://patchwork.freedesktop.org/series/131815/
State : success

== Summary ==

CI Bug Log - changes from xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde_BAT -> xe-pw-131815v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde_BAT and xe-pw-131815v3_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - Statuses : 5 pass(s)
    - Exec time: [7.06, 50.39] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde -> xe-pw-131815v3

  IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde: 3addfb8584a4fcbff8123461682e5bdfd8785bde
  xe-pw-131815v3: 131815v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v3/index.html

--===============5949249990702610544==
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
<tr><td><b>Series:</b></td><td>TTM shrinker helpers and xe buffer object shrinker (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131815/">https://patchwork.freedesktop.org/series/131815/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde_BAT -&gt; xe-pw-131815v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde_BAT and xe-pw-131815v3_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [7.06, 50.39] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde -&gt; xe-pw-131815v3</li>
</ul>
<p>IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1311-3addfb8584a4fcbff8123461682e5bdfd8785bde: 3addfb8584a4fcbff8123461682e5bdfd8785bde<br />
  xe-pw-131815v3: 131815v3</p>

</body>
</html>

--===============5949249990702610544==--
