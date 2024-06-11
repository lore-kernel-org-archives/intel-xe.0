Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E10BC25B76
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 07:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C95510E0FC;
	Tue, 11 Jun 2024 07:51:37 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BBE10E0FC;
 Tue, 11 Jun 2024 07:51:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4395622375634613443=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv5=2C1/2?=
 =?utf-8?q?=5D_devcoredump=3A_Add_dev=5Fcoredumpm=5Ftimeout=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 07:51:35 -0000
Message-ID: <171809229548.66237.8986919192581479148@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240610161133.156566-1-jose.souza@intel.com>
In-Reply-To: <20240610161133.156566-1-jose.souza@intel.com>
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

--===============4395622375634613443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v5,1/2] devcoredump: Add dev_coredumpm_timeout() (rev2)
URL   : https://patchwork.freedesktop.org/series/134684/
State : success

== Summary ==

CI Bug Log - changes from xe-1441-34997e6c7d5e203ee9b54b8da59270ead2a82c59_BAT -> xe-pw-134684v2_BAT
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

  * Linux: xe-1441-34997e6c7d5e203ee9b54b8da59270ead2a82c59 -> xe-pw-134684v2

  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1441-34997e6c7d5e203ee9b54b8da59270ead2a82c59: 34997e6c7d5e203ee9b54b8da59270ead2a82c59
  xe-pw-134684v2: 134684v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134684v2/index.html

--===============4395622375634613443==
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
<tr><td><b>Series:</b></td><td>series starting with [v5,1/2] devcoredump: Add dev_coredumpm_timeout() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134684/">https://patchwork.freedesktop.org/series/134684/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134684v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134684v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1441-34997e6c7d5e203ee9b54b8da59270ead2a82c59_BAT -&gt; xe-pw-134684v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1441-34997e6c7d5e203ee9b54b8da59270ead2a82c59 -&gt; xe-pw-134684v2</li>
</ul>
<p>IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1441-34997e6c7d5e203ee9b54b8da59270ead2a82c59: 34997e6c7d5e203ee9b54b8da59270ead2a82c59<br />
  xe-pw-134684v2: 134684v2</p>

</body>
</html>

--===============4395622375634613443==--
