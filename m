Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B076C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 08:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAADA10EE37;
	Fri, 17 May 2024 08:27:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C61210E06C;
 Fri, 17 May 2024 08:27:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6555340917700904622=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_xe_bo_shrinker_and_exhaustive_ev?=
 =?utf-8?q?iction_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 May 2024 08:27:25 -0000
Message-ID: <171593444511.2142370.11941912400105287748@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
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

--===============6555340917700904622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe bo shrinker and exhaustive eviction (rev5)
URL   : https://patchwork.freedesktop.org/series/133643/
State : success

== Summary ==

CI Bug Log - changes from xe-1303-8c333e0fa983bcd68fbae77a74c852192beff86a_BAT -> xe-pw-133643v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-adlp-7 

New tests
---------

  New tests have been introduced between xe-1303-8c333e0fa983bcd68fbae77a74c852192beff86a_BAT and xe-pw-133643v5_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - Statuses : 4 pass(s)
    - Exec time: [7.18, 51.50] s

  

Known issues
------------

  Here are the changes found in xe-pw-133643v5_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1303-8c333e0fa983bcd68fbae77a74c852192beff86a -> xe-pw-133643v5

  IGT_7860: 05b3f5540c6dcaacdf2169dc730c126df9ffd7e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1303-8c333e0fa983bcd68fbae77a74c852192beff86a: 8c333e0fa983bcd68fbae77a74c852192beff86a
  xe-pw-133643v5: 133643v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v5/index.html

--===============6555340917700904622==
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
<tr><td><b>Series:</b></td><td>xe bo shrinker and exhaustive eviction (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133643/">https://patchwork.freedesktop.org/series/133643/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1303-8c333e0fa983bcd68fbae77a74c852192beff86a_BAT -&gt; xe-pw-133643v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1303-8c333e0fa983bcd68fbae77a74c852192beff86a_BAT and xe-pw-133643v5_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [7.18, 51.50] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133643v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1303-8c333e0fa983bcd68fbae77a74c852192beff86a -&gt; xe-pw-133643v5</li>
</ul>
<p>IGT_7860: 05b3f5540c6dcaacdf2169dc730c126df9ffd7e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1303-8c333e0fa983bcd68fbae77a74c852192beff86a: 8c333e0fa983bcd68fbae77a74c852192beff86a<br />
  xe-pw-133643v5: 133643v5</p>

</body>
</html>

--===============6555340917700904622==--
