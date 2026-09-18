Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201ABC982D0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 01:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6C810E509;
	Fri, 18 Sep 2026 01:51:32 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D3410E509;
 Fri, 18 Sep 2026 01:51:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5653370136120928604=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Consolidate_semap?=
 =?utf-8?q?hore_instruction_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 01:51:31 -0000
Message-ID: <178969629128.178464.5080648633017377970@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917-semaphore_inst-v1-1-61e49405f71d@intel.com>
In-Reply-To: <20260917-semaphore_inst-v1-1-61e49405f71d@intel.com>
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

--===============5653370136120928604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Consolidate semaphore instruction definitions
URL   : https://patchwork.freedesktop.org/series/174461/
State : success

== Summary ==

CI Bug Log - changes from xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb_BAT -> xe-pw-174461v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9099 -> IGT_9100
  * Linux: xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb -> xe-pw-174461v1

  IGT_9099: 9099
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb: 1687195a722fb2a8bfa0af9b739a0485034fefcb
  xe-pw-174461v1: 174461v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/index.html

--===============5653370136120928604==
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
<tr><td><b>Series:</b></td><td>drm/xe: Consolidate semaphore instruction definitions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174461/">https://patchwork.freedesktop.org/series/174461/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb_BAT -&gt; xe-pw-174461v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9099 -&gt; IGT_9100</li>
<li>Linux: xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb -&gt; xe-pw-174461v1</li>
</ul>
<p>IGT_9099: 9099<br />
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb: 1687195a722fb2a8bfa0af9b739a0485034fefcb<br />
  xe-pw-174461v1: 174461v1</p>

</body>
</html>

--===============5653370136120928604==--
