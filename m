Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0911FC47077
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 00:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A316110E53D;
	Wed, 10 Jan 2024 00:08:39 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3AE10E536;
 Wed, 10 Jan 2024 00:08:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8368921282299679126=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe/guc=3A_Use_proper_definitions_while_processing_G2H_events?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Wed, 10 Jan 2024 00:08:38 -0000
Message-ID: <170484531871.240792.13552467225445847446@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240109230015.365-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240109230015.365-1-michal.wajdeczko@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============8368921282299679126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/guc: Use proper definitions while processing G2H events
URL   : https://patchwork.freedesktop.org/series/128396/
State : success

== Summary ==

CI Bug Log - changes from xe-612-0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6_BAT -> xe-pw-128396v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-128396v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1101]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-612-0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128396v1/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#1033]) -> [DMESG-FAIL][4] ([Intel XE#1033])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-612-0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128396v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1101]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1101


Build changes
-------------

  * Linux: xe-612-0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6 -> xe-pw-128396v1

  IGT_7664: 5b8a8dcca7711c73f9cfeb66b5deb27751290fb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-612-0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6: 0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6
  xe-pw-128396v1: 128396v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128396v1/index.html

--===============8368921282299679126==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/guc: Use proper definitions while processing G2H events</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128396/">https://patchwork.freedesktop.org/series/128396/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128396v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128396v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-612-0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6_BAT -&gt; xe-pw-128396v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128396v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-612-0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128396v1/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1101">Intel XE#1101</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-612-0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128396v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-612-0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6 -&gt; xe-pw-128396v1</li>
</ul>
<p>IGT_7664: 5b8a8dcca7711c73f9cfeb66b5deb27751290fb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-612-0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6: 0ae6ec9ac768c2ee81f8b7f153d04358e34ff0d6<br />
  xe-pw-128396v1: 128396v1</p>

</body>
</html>

--===============8368921282299679126==--
