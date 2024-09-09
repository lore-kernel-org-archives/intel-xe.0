Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECC2ECE581
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 23:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2ED10E07F;
	Mon,  9 Sep 2024 23:08:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F8910E07F;
 Mon,  9 Sep 2024 23:08:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0997027899623446320=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Flush_all_page_faults_when_closi?=
 =?utf-8?q?ng_a_VM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Sep 2024 23:08:37 -0000
Message-ID: <172592331772.978640.1188172034767826116@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240909223225.665761-1-matthew.brost@intel.com>
In-Reply-To: <20240909223225.665761-1-matthew.brost@intel.com>
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

--===============0997027899623446320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Flush all page faults when closing a VM
URL   : https://patchwork.freedesktop.org/series/138433/
State : success

== Summary ==

CI Bug Log - changes from xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114_BAT -> xe-pw-138433v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114 -> xe-pw-138433v1

  IGT_8011: 26dca87f1252b7f6f0c0f833050256f0244d61e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114: 40360ec4ceee7e8c16a187299cadf3e6babc8114
  xe-pw-138433v1: 138433v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138433v1/index.html

--===============0997027899623446320==
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
<tr><td><b>Series:</b></td><td>Flush all page faults when closing a VM</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138433/">https://patchwork.freedesktop.org/series/138433/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138433v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138433v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114_BAT -&gt; xe-pw-138433v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114 -&gt; xe-pw-138433v1</li>
</ul>
<p>IGT_8011: 26dca87f1252b7f6f0c0f833050256f0244d61e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114: 40360ec4ceee7e8c16a187299cadf3e6babc8114<br />
  xe-pw-138433v1: 138433v1</p>

</body>
</html>

--===============0997027899623446320==--
