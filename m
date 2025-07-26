Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35A0C87FCE
	for <intel-xe@archiver.kernel.org>; Sat, 26 Jul 2025 03:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A20A10E07A;
	Sat, 26 Jul 2025 03:28:38 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E0D10E07A;
 Sat, 26 Jul 2025 03:28:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7446572646728006911=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Add_more_GuC_?=
 =?utf-8?q?load_error_status_codes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 26 Jul 2025 03:28:37 -0000
Message-ID: <175350051762.191429.13028090125422022493@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250726024337.4056272-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250726024337.4056272-1-John.C.Harrison@Intel.com>
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

--===============7446572646728006911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add more GuC load error status codes (rev2)
URL   : https://patchwork.freedesktop.org/series/152135/
State : success

== Summary ==

CI Bug Log - changes from xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04_BAT -> xe-pw-152135v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

New tests
---------

  New tests have been introduced between xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04_BAT and xe-pw-152135v2_BAT:

### New IGT tests (2) ###

  * igt@xe_pm_residency@gt-c6-on-idle@gt0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@xe_pm_residency@gt-c6-on-idle@gt1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0, 0.00] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04 -> xe-pw-152135v2

  IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04: 11e629e8c02307977802ba0ea8c60ddb15b17d04
  xe-pw-152135v2: 152135v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152135v2/index.html

--===============7446572646728006911==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add more GuC load error status codes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152135/">https://patchwork.freedesktop.org/series/152135/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152135v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152135v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04_BAT -&gt; xe-pw-152135v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04_BAT and xe-pw-152135v2_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle@gt0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle@gt1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04 -&gt; xe-pw-152135v2</li>
</ul>
<p>IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04: 11e629e8c02307977802ba0ea8c60ddb15b17d04<br />
  xe-pw-152135v2: 152135v2</p>

</body>
</html>

--===============7446572646728006911==--
