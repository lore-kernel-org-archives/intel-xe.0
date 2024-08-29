Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CDDCA0EC8
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 23:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798E410E7B7;
	Thu, 29 Aug 2024 23:45:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4B110E7B7;
 Thu, 29 Aug 2024 23:45:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3042409373094011928=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display=3A_Drop_unnecessa?=
 =?utf-8?q?ry_xe=5Fgt=2Eh_includes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Aug 2024 23:45:48 -0000
Message-ID: <172497514810.849852.12546772503398773243@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240829230307.886233-2-matthew.d.roper@intel.com>
In-Reply-To: <20240829230307.886233-2-matthew.d.roper@intel.com>
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

--===============3042409373094011928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Drop unnecessary xe_gt.h includes
URL   : https://patchwork.freedesktop.org/series/137981/
State : success

== Summary ==

CI Bug Log - changes from xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355_BAT -> xe-pw-137981v1_BAT
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

  * Linux: xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355 -> xe-pw-137981v1

  IGT_7999: a73311079a5d8ac99eb25336a8369a2c3c6b519b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355: ba2da4a21bf2d821ddf79e6d5c9b994202156355
  xe-pw-137981v1: 137981v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/index.html

--===============3042409373094011928==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Drop unnecessary xe_gt.h includes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137981/">https://patchwork.freedesktop.org/series/137981/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137981v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355_BAT -&gt; xe-pw-137981v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355 -&gt; xe-pw-137981v1</li>
</ul>
<p>IGT_7999: a73311079a5d8ac99eb25336a8369a2c3c6b519b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1861-ba2da4a21bf2d821ddf79e6d5c9b994202156355: ba2da4a21bf2d821ddf79e6d5c9b994202156355<br />
  xe-pw-137981v1: 137981v1</p>

</body>
</html>

--===============3042409373094011928==--
