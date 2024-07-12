Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992B0C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 08:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4243310EC70;
	Fri, 12 Jul 2024 08:27:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0319B10EC6B;
 Fri, 12 Jul 2024 08:27:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1004967968317685214=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/6=5D_d?=
 =?utf-8?q?rm/xe/migrate=3A_Handle_clear_ccs_logic_for_xe2_dgfx?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jul 2024 08:27:16 -0000
Message-ID: <172077283600.166389.9271224990522912673@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1720768378.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1720768378.git.akshata.jahagirdar@intel.com>
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

--===============1004967968317685214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
URL   : https://patchwork.freedesktop.org/series/136026/
State : success

== Summary ==

CI Bug Log - changes from xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e_BAT -> xe-pw-136026v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 6)
------------------------------

  Missing    (1): bat-bmg-1 

New tests
---------

  New tests have been introduced between xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e_BAT and xe-pw-136026v1_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in xe-pw-136026v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#324]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136026v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e -> xe-pw-136026v1

  IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e: 0b9174f237436b60b1c6fd9d5fbacbfcde660e3e
  xe-pw-136026v1: 136026v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136026v1/index.html

--===============1004967968317685214==
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
<tr><td><b>Series:</b></td><td>series starting with [1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136026/">https://patchwork.freedesktop.org/series/136026/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136026v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136026v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e_BAT -&gt; xe-pw-136026v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 6)</h2>
<p>Missing    (1): bat-bmg-1 </p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e_BAT and xe-pw-136026v1_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136026v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136026v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e -&gt; xe-pw-136026v1</li>
</ul>
<p>IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e: 0b9174f237436b60b1c6fd9d5fbacbfcde660e3e<br />
  xe-pw-136026v1: 136026v1</p>

</body>
</html>

--===============1004967968317685214==--
