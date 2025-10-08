Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A016DCAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 19:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626D710E8C4;
	Wed,  8 Oct 2025 19:04:51 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2C310E078;
 Wed,  8 Oct 2025 19:04:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0942527881508047695=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_VF_migration_redesign_=28re?=
 =?utf-8?q?v9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Oct 2025 19:04:50 -0000
Message-ID: <175995029076.19641.5702799446221888010@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251008180500.3261209-1-matthew.brost@intel.com>
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
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

--===============0942527881508047695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF migration redesign (rev9)
URL   : https://patchwork.freedesktop.org/series/154627/
State : success

== Summary ==

CI Bug Log - changes from xe-3886-f929eafc95342ea5377f79705864d50dd325c79f_BAT -> xe-pw-154627v9_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-154627v9_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#6287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6287


Build changes
-------------

  * IGT: IGT_8578 -> IGT_8579
  * Linux: xe-3886-f929eafc95342ea5377f79705864d50dd325c79f -> xe-pw-154627v9

  IGT_8578: fd1f7d868fb6df61db6891ce0bbc8fcd26a0e7ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8579: 8579
  xe-3886-f929eafc95342ea5377f79705864d50dd325c79f: f929eafc95342ea5377f79705864d50dd325c79f
  xe-pw-154627v9: 154627v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v9/index.html

--===============0942527881508047695==
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
<tr><td><b>Series:</b></td><td>VF migration redesign (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154627/">https://patchwork.freedesktop.org/series/154627/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3886-f929eafc95342ea5377f79705864d50dd325c79f_BAT -&gt; xe-pw-154627v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154627v9_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8578 -&gt; IGT_8579</li>
<li>Linux: xe-3886-f929eafc95342ea5377f79705864d50dd325c79f -&gt; xe-pw-154627v9</li>
</ul>
<p>IGT_8578: fd1f7d868fb6df61db6891ce0bbc8fcd26a0e7ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8579: 8579<br />
  xe-3886-f929eafc95342ea5377f79705864d50dd325c79f: f929eafc95342ea5377f79705864d50dd325c79f<br />
  xe-pw-154627v9: 154627v9</p>

</body>
</html>

--===============0942527881508047695==--
