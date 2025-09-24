Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C10CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 18:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AC610E7C0;
	Wed, 24 Sep 2025 18:36:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0876310E7BF;
 Wed, 24 Sep 2025 18:36:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2174002743899624667=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/migrate=3A_Revamp_PA?=
 =?utf-8?q?T_index_selection_for_migrate_PTEs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 18:36:50 -0000
Message-ID: <175873901099.363593.16374805092351565468@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250924174100.1551195-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20250924174100.1551195-2-sanjay.kumar.yadav@intel.com>
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

--===============2174002743899624667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: Revamp PAT index selection for migrate PTEs (rev2)
URL   : https://patchwork.freedesktop.org/series/154629/
State : failure

== Summary ==

CI Bug Log - changes from xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf_BAT -> xe-pw-154629v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154629v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154629v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154629v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-bmg-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-bmg-2/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-bmg-1/igt@kms_addfb_basic@addfb25-4-tiled.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-bmg-1/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-dg2-oem2:       [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-atsm-2:         [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-simple.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-simple.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - {bat-ptl-2}:        [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-ptl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-ptl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - {bat-ptl-1}:        [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-ptl-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-ptl-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  
Known issues
------------

  Here are the changes found in xe-pw-154629v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-lnl-2:          [PASS][13] -> [ABORT][14] ([Intel XE#3970])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-lnl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-lnl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - bat-lnl-1:          [PASS][15] -> [ABORT][16] ([Intel XE#3970])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-lnl-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-lnl-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][17] -> [DMESG-WARN][18] ([Intel XE#4543]) +1 other test dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8550 -> IGT_8551
  * Linux: xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf -> xe-pw-154629v2

  IGT_8550: 4f8c7886ad02e116804ec08714f17bce1755c6e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8551: 8551
  xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf: a4d9163251f4832a7d34d4b59449f9a68b9b7adf
  xe-pw-154629v2: 154629v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/index.html

--===============2174002743899624667==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: Revamp PAT index selection for migrate PTEs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154629/">https://patchwork.freedesktop.org/series/154629/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf_BAT -&gt; xe-pw-154629v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154629v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-154629v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-154629v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-bmg-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-bmg-2/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-bmg-1/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-bmg-1/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-simple.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_addfb_basic@addfb25-x-tiled-legacy:<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-ptl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-ptl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">ABORT</a></li>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-ptl-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-ptl-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154629v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-lnl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-lnl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-lnl-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-lnl-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154629v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8550 -&gt; IGT_8551</li>
<li>Linux: xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf -&gt; xe-pw-154629v2</li>
</ul>
<p>IGT_8550: 4f8c7886ad02e116804ec08714f17bce1755c6e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8551: 8551<br />
  xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf: a4d9163251f4832a7d34d4b59449f9a68b9b7adf<br />
  xe-pw-154629v2: 154629v2</p>

</body>
</html>

--===============2174002743899624667==--
