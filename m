Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7C8CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A3910E8D9;
	Wed,  8 Oct 2025 21:03:46 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDEA10E8D9;
 Wed,  8 Oct 2025 21:03:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7116327452570549879=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Don=27t_allow_evi?=
 =?utf-8?q?cting_of_BOs_in_same_VM_in_array_of_VM_binds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Oct 2025 21:03:45 -0000
Message-ID: <175995742569.20465.3154466452986837466@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251008200051.3423684-1-matthew.brost@intel.com>
In-Reply-To: <20251008200051.3423684-1-matthew.brost@intel.com>
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

--===============7116327452570549879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Don't allow evicting of BOs in same VM in array of VM binds
URL   : https://patchwork.freedesktop.org/series/155637/
State : success

== Summary ==

CI Bug Log - changes from xe-3886-f929eafc95342ea5377f79705864d50dd325c79f_BAT -> xe-pw-155637v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8578 -> IGT_8579
  * Linux: xe-3886-f929eafc95342ea5377f79705864d50dd325c79f -> xe-pw-155637v1

  IGT_8578: fd1f7d868fb6df61db6891ce0bbc8fcd26a0e7ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8579: 8579
  xe-3886-f929eafc95342ea5377f79705864d50dd325c79f: f929eafc95342ea5377f79705864d50dd325c79f
  xe-pw-155637v1: 155637v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155637v1/index.html

--===============7116327452570549879==
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
<tr><td><b>Series:</b></td><td>drm/xe: Don&#x27;t allow evicting of BOs in same VM in array of VM binds</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155637/">https://patchwork.freedesktop.org/series/155637/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155637v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155637v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3886-f929eafc95342ea5377f79705864d50dd325c79f_BAT -&gt; xe-pw-155637v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8578 -&gt; IGT_8579</li>
<li>Linux: xe-3886-f929eafc95342ea5377f79705864d50dd325c79f -&gt; xe-pw-155637v1</li>
</ul>
<p>IGT_8578: fd1f7d868fb6df61db6891ce0bbc8fcd26a0e7ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8579: 8579<br />
  xe-3886-f929eafc95342ea5377f79705864d50dd325c79f: f929eafc95342ea5377f79705864d50dd325c79f<br />
  xe-pw-155637v1: 155637v1</p>

</body>
</html>

--===============7116327452570549879==--
