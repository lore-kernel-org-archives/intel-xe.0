Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ADEC5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 08:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369C310E100;
	Fri, 14 Aug 2026 08:57:01 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F8F10E100;
 Fri, 14 Aug 2026 08:57:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6188862830417417291=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gpuvm=3A_two_pass_locki?=
 =?utf-8?q?ng_for_exec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Aug 2026 08:57:00 -0000
Message-ID: <178669782066.51858.11870619904086643628@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260814073258.893007-1-matthew.brost@intel.com>
In-Reply-To: <20260814073258.893007-1-matthew.brost@intel.com>
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

--===============6188862830417417291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpuvm: two pass locking for exec
URL   : https://patchwork.freedesktop.org/series/172205/
State : success

== Summary ==

CI Bug Log - changes from xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf_BAT -> xe-pw-172205v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf -> xe-pw-172205v1

  IGT_9056: 9056
  xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf: ba85a54e3c7ed4f730b198fcf2743579261c0eaf
  xe-pw-172205v1: 172205v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172205v1/index.html

--===============6188862830417417291==
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
<tr><td><b>Series:</b></td><td>drm/gpuvm: two pass locking for exec</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172205/">https://patchwork.freedesktop.org/series/172205/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172205v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172205v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf_BAT -&gt; xe-pw-172205v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf -&gt; xe-pw-172205v1</li>
</ul>
<p>IGT_9056: 9056<br />
  xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf: ba85a54e3c7ed4f730b198fcf2743579261c0eaf<br />
  xe-pw-172205v1: 172205v1</p>

</body>
</html>

--===============6188862830417417291==--
