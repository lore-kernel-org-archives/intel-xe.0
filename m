Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C45C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 17:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D8310E1C1;
	Tue, 18 Jun 2024 17:58:29 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC8710E22C;
 Tue, 18 Jun 2024 17:58:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8363193836366687580=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Convert_multiple_bind_ops_to_1_j?=
 =?utf-8?q?ob_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 17:58:28 -0000
Message-ID: <171873350831.104453.17538978212843865188@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618171509.3336601-1-matthew.brost@intel.com>
In-Reply-To: <20240618171509.3336601-1-matthew.brost@intel.com>
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

--===============8363193836366687580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Convert multiple bind ops to 1 job (rev4)
URL   : https://patchwork.freedesktop.org/series/133034/
State : failure

== Summary ==

CI Bug Log - changes from xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c_BAT -> xe-pw-133034v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133034v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133034v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133034v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v4/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  


Build changes
-------------

  * Linux: xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c -> xe-pw-133034v4

  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c: fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c
  xe-pw-133034v4: 133034v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v4/index.html

--===============8363193836366687580==
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
<tr><td><b>Series:</b></td><td>Convert multiple bind ops to 1 job (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133034/">https://patchwork.freedesktop.org/series/133034/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c_BAT -&gt; xe-pw-133034v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133034v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133034v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133034v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v4/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c -&gt; xe-pw-133034v4</li>
</ul>
<p>IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c: fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c<br />
  xe-pw-133034v4: 133034v4</p>

</body>
</html>

--===============8363193836366687580==--
