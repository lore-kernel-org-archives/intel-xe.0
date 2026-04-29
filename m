Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58422FF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 12:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9B310E3D3;
	Wed, 29 Apr 2026 12:31:40 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A68710E3D3;
 Wed, 29 Apr 2026 12:31:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1262078893160323583=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Use_drmm=5Fmutex?=
 =?utf-8?q?=5Finit_for_VRAM_manager_lock?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Apr 2026 12:31:39 -0000
Message-ID: <177746589916.24138.16175350252391088499@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260429093138.3899280-2-tejas.upadhyay@intel.com>
In-Reply-To: <20260429093138.3899280-2-tejas.upadhyay@intel.com>
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

--===============1262078893160323583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use drmm_mutex_init for VRAM manager lock
URL   : https://patchwork.freedesktop.org/series/165693/
State : success

== Summary ==

CI Bug Log - changes from xe-4949-1db870ffb55b6414a78d7609ba7e08adf880dfc5_BAT -> xe-pw-165693v1_BAT
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

  * Linux: xe-4949-1db870ffb55b6414a78d7609ba7e08adf880dfc5 -> xe-pw-165693v1

  IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4949-1db870ffb55b6414a78d7609ba7e08adf880dfc5: 1db870ffb55b6414a78d7609ba7e08adf880dfc5
  xe-pw-165693v1: 165693v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165693v1/index.html

--===============1262078893160323583==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use drmm_mutex_init for VRAM manager lock</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165693/">https://patchwork.freedesktop.org/series/165693/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165693v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165693v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4949-1db870ffb55b6414a78d7609ba7e08adf880dfc5_BAT -&gt; xe-pw-165693v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4949-1db870ffb55b6414a78d7609ba7e08adf880dfc5 -&gt; xe-pw-165693v1</li>
</ul>
<p>IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4949-1db870ffb55b6414a78d7609ba7e08adf880dfc5: 1db870ffb55b6414a78d7609ba7e08adf880dfc5<br />
  xe-pw-165693v1: 165693v1</p>

</body>
</html>

--===============1262078893160323583==--
