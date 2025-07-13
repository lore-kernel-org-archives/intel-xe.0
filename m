Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193B9C83F17
	for <intel-xe@archiver.kernel.org>; Sun, 13 Jul 2025 18:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AA310E02D;
	Sun, 13 Jul 2025 18:19:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0F810E04C;
 Sun, 13 Jul 2025 18:19:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7098260613616352528=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Crashlog_Type1_Version2_sup?=
 =?utf-8?q?port_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 13 Jul 2025 18:19:03 -0000
Message-ID: <175243074317.157578.16932799036882260899@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
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

--===============7098260613616352528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crashlog Type1 Version2 support (rev8)
URL   : https://patchwork.freedesktop.org/series/149120/
State : success

== Summary ==

CI Bug Log - changes from xe-3405-453e24ac0fd683880e40b3a844a774f5a427dc55_BAT -> xe-pw-149120v8_BAT
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

  New tests have been introduced between xe-3405-453e24ac0fd683880e40b3a844a774f5a427dc55_BAT and xe-pw-149120v8_BAT:

### New IGT tests (1) ###

  * igt@xe_intel_bb@create-in-region@region-vram0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3405-453e24ac0fd683880e40b3a844a774f5a427dc55 -> xe-pw-149120v8

  IGT_8454: 67f8a0cc3a159bf6f912c08c030dfed5a85af328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3405-453e24ac0fd683880e40b3a844a774f5a427dc55: 453e24ac0fd683880e40b3a844a774f5a427dc55
  xe-pw-149120v8: 149120v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v8/index.html

--===============7098260613616352528==
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
<tr><td><b>Series:</b></td><td>Crashlog Type1 Version2 support (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149120/">https://patchwork.freedesktop.org/series/149120/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3405-453e24ac0fd683880e40b3a844a774f5a427dc55_BAT -&gt; xe-pw-149120v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3405-453e24ac0fd683880e40b3a844a774f5a427dc55_BAT and xe-pw-149120v8_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_intel_bb@create-in-region@region-vram0:<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3405-453e24ac0fd683880e40b3a844a774f5a427dc55 -&gt; xe-pw-149120v8</li>
</ul>
<p>IGT_8454: 67f8a0cc3a159bf6f912c08c030dfed5a85af328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3405-453e24ac0fd683880e40b3a844a774f5a427dc55: 453e24ac0fd683880e40b3a844a774f5a427dc55<br />
  xe-pw-149120v8: 149120v8</p>

</body>
</html>

--===============7098260613616352528==--
