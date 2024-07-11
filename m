Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98D8C3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 11:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610B010E14B;
	Thu, 11 Jul 2024 11:20:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA21310E14B;
 Thu, 11 Jul 2024 11:20:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8924834854067573278=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/6=5D_d?=
 =?utf-8?q?rm/xe/migrate=3A_Handle_clear_ccs_logic_for_xe2_dgfx?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jul 2024 11:20:30 -0000
Message-ID: <172069683068.125016.3608249482594201402@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1720689220.git.akshata.jahagirdar@intel.com>
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

--===============8924834854067573278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
URL   : https://patchwork.freedesktop.org/series/135990/
State : success

== Summary ==

CI Bug Log - changes from xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13_BAT -> xe-pw-135990v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135990v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit} (NEW):
    - {bat-bmg-1}:        NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_live_ktest@xe_migrate:
    - {bat-bmg-1}:        [SKIP][2] ([Intel XE#2109]) -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - {bat-bmg-1}:        NOTRUN -> [ABORT][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  
New tests
---------

  New tests have been introduced between xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13_BAT and xe-pw-135990v1_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.00, 0.03] s

  

Known issues
------------

  Here are the changes found in xe-pw-135990v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([Intel XE#2196])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3:
    - {bat-bmg-1}:        [DMESG-WARN][7] ([Intel XE#2232]) -> [PASS][8] +63 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - {bat-bmg-1}:        [INCOMPLETE][9] ([Intel XE#2232]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_live_ktest@xe_bo:
    - {bat-bmg-1}:        [SKIP][11] ([Intel XE#2109]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/bat-bmg-1/igt@xe_live_ktest@xe_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@xe_live_ktest@xe_bo.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109
  [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196
  [Intel XE#2232]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2232


Build changes
-------------

  * IGT: IGT_7922 -> IGT_7923
  * Linux: xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13 -> xe-pw-135990v1

  IGT_7922: 325d4f4efbf869f93d3b4479046713d0ce7220e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7923: 09a7c4e24369f72943305a2ef2e9a9531bff5bb7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13: 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13
  xe-pw-135990v1: 135990v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/index.html

--===============8924834854067573278==
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
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135990/">https://patchwork.freedesktop.org/series/135990/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13_BAT -&gt; xe-pw-135990v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135990v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit} (NEW):<ul>
<li>{bat-bmg-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>{bat-bmg-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13_BAT and xe-pw-135990v1_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:<ul>
<li>Statuses : 1 incomplete(s) 6 pass(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135990v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196">Intel XE#2196</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2232">Intel XE#2232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html">PASS</a> +63 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2232">Intel XE#2232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/bat-bmg-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135990v1/bat-bmg-1/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7922 -&gt; IGT_7923</li>
<li>Linux: xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13 -&gt; xe-pw-135990v1</li>
</ul>
<p>IGT_7922: 325d4f4efbf869f93d3b4479046713d0ce7220e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7923: 09a7c4e24369f72943305a2ef2e9a9531bff5bb7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13: 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13<br />
  xe-pw-135990v1: 135990v1</p>

</body>
</html>

--===============8924834854067573278==--
