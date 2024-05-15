Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E17C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 22:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55A710E0BE;
	Wed, 15 May 2024 22:46:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1778F10E0BE;
 Wed, 15 May 2024 22:46:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7670548134513289890=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Per_client_usage_=28re?=
 =?utf-8?q?v4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 May 2024 22:46:17 -0000
Message-ID: <171581317709.2118792.8467581050507446349@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
In-Reply-To: <20240515214258.59209-1-lucas.demarchi@intel.com>
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

--===============7670548134513289890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Per client usage (rev4)
URL   : https://patchwork.freedesktop.org/series/132477/
State : success

== Summary ==

CI Bug Log - changes from xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7_BAT -> xe-pw-132477v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132477v4_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - {bat-lnl-1}:        [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7 -> xe-pw-132477v4

  IGT_7856: 280f66b4d83048ea76bea6fd31af648c51996486 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7: be81838bd7d4faec2955962ed6a74e3f4cc6daf7
  xe-pw-132477v4: 132477v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/index.html

--===============7670548134513289890==
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
<tr><td><b>Series:</b></td><td>drm/xe: Per client usage (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132477/">https://patchwork.freedesktop.org/series/132477/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7_BAT -&gt; xe-pw-132477v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132477v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7 -&gt; xe-pw-132477v4</li>
</ul>
<p>IGT_7856: 280f66b4d83048ea76bea6fd31af648c51996486 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7: be81838bd7d4faec2955962ed6a74e3f4cc6daf7<br />
  xe-pw-132477v4: 132477v4</p>

</body>
</html>

--===============7670548134513289890==--
