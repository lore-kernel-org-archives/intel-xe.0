Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F274ECD13DA
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 04:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C03410E021;
	Tue,  5 May 2026 04:26:50 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B8410E021;
 Tue,  5 May 2026 04:26:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4540794779718909416=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_TTM_shrinker_fragmentation_?=
 =?utf-8?q?/_partial_restore_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 04:26:48 -0000
Message-ID: <177795520886.37456.12681294340203665904@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260505031450.3262489-1-matthew.brost@intel.com>
In-Reply-To: <20260505031450.3262489-1-matthew.brost@intel.com>
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

--===============4540794779718909416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: TTM shrinker fragmentation / partial restore fixes
URL   : https://patchwork.freedesktop.org/series/165946/
State : success

== Summary ==

CI Bug Log - changes from xe-4983-5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e_BAT -> xe-pw-165946v1_BAT
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

  * Linux: xe-4983-5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e -> xe-pw-165946v1

  IGT_8884: 2e185bca126c4d135fe7fe579d0a3a177f150813 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4983-5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e: 5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e
  xe-pw-165946v1: 165946v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165946v1/index.html

--===============4540794779718909416==
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
<tr><td><b>Series:</b></td><td>TTM shrinker fragmentation / partial restore fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165946/">https://patchwork.freedesktop.org/series/165946/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165946v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165946v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4983-5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e_BAT -&gt; xe-pw-165946v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4983-5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e -&gt; xe-pw-165946v1</li>
</ul>
<p>IGT_8884: 2e185bca126c4d135fe7fe579d0a3a177f150813 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4983-5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e: 5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e<br />
  xe-pw-165946v1: 165946v1</p>

</body>
</html>

--===============4540794779718909416==--
