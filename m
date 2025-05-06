Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3605EC3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 07:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E6410E5DF;
	Tue,  6 May 2025 07:59:03 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA7F10E1E1;
 Tue,  6 May 2025 07:59:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0967999248574717638=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Update_migration_?=
 =?utf-8?q?tests=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 07:59:03 -0000
Message-ID: <174651834344.50407.18058056050446526730@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250502093514.510621-1-dev@lankhorst.se>
In-Reply-To: <20250502093514.510621-1-dev@lankhorst.se>
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

--===============0967999248574717638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Update migration tests.
URL   : https://patchwork.freedesktop.org/series/148544/
State : failure

== Summary ==

CI Bug Log - changes from xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27_BAT -> xe-pw-148544v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148544v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148544v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148544v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-bmg-2:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html
    - bat-bmg-1:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * {igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit} (NEW):
    - bat-adlp-vf:        NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html
    - bat-lnl-1:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html
    - bat-adlp-7:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html
    - bat-atsm-2:         NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html

  
New tests
---------

  New tests have been introduced between xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27_BAT and xe-pw-148544v1_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit:
    - Statuses : 2 fail(s) 2 pass(s) 3 skip(s)
    - Exec time: [0.08, 8.78] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27 -> xe-pw-148544v1

  IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27: d191d21d3ce573759a1a2f82443d3bf8e23b7b27
  xe-pw-148544v1: 148544v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/index.html

--===============0967999248574717638==
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
<tr><td><b>Series:</b></td><td>drm/xe: Update migration tests.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148544/">https://patchwork.freedesktop.org/series/148544/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27_BAT -&gt; xe-pw-148544v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148544v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-148544v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-148544v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit} (NEW):</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html">SKIP</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html">SKIP</a></li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html">FAIL</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27_BAT and xe-pw-148544v1_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit:<ul>
<li>Statuses : 2 fail(s) 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.08, 8.78] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27 -&gt; xe-pw-148544v1</li>
</ul>
<p>IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27: d191d21d3ce573759a1a2f82443d3bf8e23b7b27<br />
  xe-pw-148544v1: 148544v1</p>

</body>
</html>

--===============0967999248574717638==--
