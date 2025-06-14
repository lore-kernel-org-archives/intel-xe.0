Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E58AC71136
	for <intel-xe@archiver.kernel.org>; Sat, 14 Jun 2025 02:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E9810E1EE;
	Sat, 14 Jun 2025 02:24:21 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155BA10E1EE;
 Sat, 14 Jun 2025 02:24:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6930803194319794171=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Extend_WA_1401809?=
 =?utf-8?q?4691_to_BMG_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 14 Jun 2025 02:24:21 -0000
Message-ID: <174986786106.79413.476068273649792927@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613231128.1261815-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250613231128.1261815-2-daniele.ceraolospurio@intel.com>
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

--===============6930803194319794171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Extend WA 14018094691 to BMG (rev2)
URL   : https://patchwork.freedesktop.org/series/147403/
State : success

== Summary ==

CI Bug Log - changes from xe-3252-4d016d6e602638e0ebc3895331224e057508c07a_BAT -> xe-pw-147403v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-3252-4d016d6e602638e0ebc3895331224e057508c07a_BAT and xe-pw-147403v2_BAT:

### New IGT tests (4) ###

  * igt@xe_create@create-massive-size:
    - Statuses : 6 pass(s)
    - Exec time: [0.00] s

  * igt@xe_mmap@bad-extensions:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@xe_mmap@bad-flags:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@xe_mmap@bad-object:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3252-4d016d6e602638e0ebc3895331224e057508c07a -> xe-pw-147403v2

  IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3252-4d016d6e602638e0ebc3895331224e057508c07a: 4d016d6e602638e0ebc3895331224e057508c07a
  xe-pw-147403v2: 147403v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147403v2/index.html

--===============6930803194319794171==
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
<tr><td><b>Series:</b></td><td>drm/xe: Extend WA 14018094691 to BMG (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147403/">https://patchwork.freedesktop.org/series/147403/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147403v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147403v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3252-4d016d6e602638e0ebc3895331224e057508c07a_BAT -&gt; xe-pw-147403v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3252-4d016d6e602638e0ebc3895331224e057508c07a_BAT and xe-pw-147403v2_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@xe_create@create-massive-size:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@bad-extensions:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@bad-flags:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@bad-object:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3252-4d016d6e602638e0ebc3895331224e057508c07a -&gt; xe-pw-147403v2</li>
</ul>
<p>IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3252-4d016d6e602638e0ebc3895331224e057508c07a: 4d016d6e602638e0ebc3895331224e057508c07a<br />
  xe-pw-147403v2: 147403v2</p>

</body>
</html>

--===============6930803194319794171==--
