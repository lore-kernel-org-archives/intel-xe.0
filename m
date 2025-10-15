Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC117CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7E010E131;
	Wed, 15 Oct 2025 18:11:33 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0400610E131;
 Wed, 15 Oct 2025 18:11:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1487632621593422663=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Optimize_vrr=2Eguardband?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 18:11:32 -0000
Message-ID: <176055189200.19017.9512355780095000981@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015102241.1797828-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251015102241.1797828-1-ankit.k.nautiyal@intel.com>
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

--===============1487632621593422663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Optimize vrr.guardband
URL   : https://patchwork.freedesktop.org/series/155979/
State : failure

== Summary ==

CI Bug Log - changes from xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554_BAT -> xe-pw-155979v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155979v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155979v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155979v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-ptl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-ptl-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-ptl-1/igt@xe_module_load@load.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_debugfs@read-all-entries}:
    - bat-adlp-7:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-adlp-7/igt@core_debugfs@read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-adlp-7/igt@core_debugfs@read-all-entries.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-bmg-1/igt@core_debugfs@read-all-entries.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-bmg-1/igt@core_debugfs@read-all-entries.html
    - bat-ptl-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-ptl-2/igt@core_debugfs@read-all-entries.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-ptl-2/igt@core_debugfs@read-all-entries.html
    - bat-dg2-oem2:       [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-dg2-oem2/igt@core_debugfs@read-all-entries.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-dg2-oem2/igt@core_debugfs@read-all-entries.html
    - bat-lnl-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-lnl-1/igt@core_debugfs@read-all-entries.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-lnl-1/igt@core_debugfs@read-all-entries.html

  
Known issues
------------

  Here are the changes found in xe-pw-155979v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-bmg-2:          [PASS][13] -> [ABORT][14] ([Intel XE#5087])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-bmg-2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][15] -> [ABORT][16] ([Intel XE#5087])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-lnl-2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-lnl-2/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087


Build changes
-------------

  * IGT: IGT_8585 -> IGT_8586
  * Linux: xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554 -> xe-pw-155979v1

  IGT_8585: 8585
  IGT_8586: dbda1336c5c99d0faa88397d5c312be72301cd94 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554: ed00bdb0008276b3497a4c811e160f18d1218554
  xe-pw-155979v1: 155979v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/index.html

--===============1487632621593422663==
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
<tr><td><b>Series:</b></td><td>Optimize vrr.guardband</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155979/">https://patchwork.freedesktop.org/series/155979/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554_BAT -&gt; xe-pw-155979v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155979v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-155979v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-155979v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-ptl-1/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@core_debugfs@read-all-entries}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-adlp-7/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-adlp-7/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-bmg-1/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-bmg-1/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-ptl-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-ptl-2/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-dg2-oem2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-dg2-oem2/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-lnl-1/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-lnl-1/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155979v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155979v1/bat-lnl-2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8585 -&gt; IGT_8586</li>
<li>Linux: xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554 -&gt; xe-pw-155979v1</li>
</ul>
<p>IGT_8585: 8585<br />
  IGT_8586: dbda1336c5c99d0faa88397d5c312be72301cd94 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3925-ed00bdb0008276b3497a4c811e160f18d1218554: ed00bdb0008276b3497a4c811e160f18d1218554<br />
  xe-pw-155979v1: 155979v1</p>

</body>
</html>

--===============1487632621593422663==--
