Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C19CC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 20:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE06810E656;
	Thu,  1 Feb 2024 20:53:10 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A9010E656;
 Thu,  1 Feb 2024 20:53:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0388090985194302497=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Drop_rebind_argument_f?=
 =?utf-8?q?rom_xe=5Fpt=5Fprepare=5Fbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Feb 2024 20:53:10 -0000
Message-ID: <170682079008.897305.171849706427754911@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201184844.2317004-1-matthew.brost@intel.com>
In-Reply-To: <20240201184844.2317004-1-matthew.brost@intel.com>
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

--===============0388090985194302497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Drop rebind argument from xe_pt_prepare_bind
URL   : https://patchwork.freedesktop.org/series/129435/
State : success

== Summary ==

CI Bug Log - changes from xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde_BAT -> xe-pw-129435v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde -> xe-pw-129435v1

  IGT_7700: 7700
  xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde: 3e58a4940c44430f20cad20ead5e1b77ed209cde
  xe-pw-129435v1: 129435v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129435v1/index.html

--===============0388090985194302497==
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
<tr><td><b>Series:</b></td><td>drm/xe: Drop rebind argument from xe_pt_prepare_bind</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129435/">https://patchwork.freedesktop.org/series/129435/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129435v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129435v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde_BAT -&gt; xe-pw-129435v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde -&gt; xe-pw-129435v1</li>
</ul>
<p>IGT_7700: 7700<br />
  xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde: 3e58a4940c44430f20cad20ead5e1b77ed209cde<br />
  xe-pw-129435v1: 129435v1</p>

</body>
</html>

--===============0388090985194302497==--
