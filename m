Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1F7C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 23:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A7910E061;
	Tue, 16 Jul 2024 23:40:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B82D10E061;
 Tue, 16 Jul 2024 23:40:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5695879896531406152=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Implement_compression_support_on?=
 =?utf-8?q?_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jul 2024 23:40:27 -0000
Message-ID: <172117322711.253774.15088520970204062527@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1721170212.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1721170212.git.akshata.jahagirdar@intel.com>
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

--===============5695879896531406152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Implement compression support on BMG
URL   : https://patchwork.freedesktop.org/series/136164/
State : failure

== Summary ==

CI Bug Log - changes from xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576_BAT -> xe-pw-136164v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136164v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136164v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136164v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - bat-lnl-1:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  * {igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit} (NEW):
    - {bat-bmg-1}:        NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_live_ktest@xe_migrate:
    - {bat-bmg-1}:        [SKIP][6] ([Intel XE#2109]) -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - {bat-lnl-2}:        [PASS][8] -> [FAIL][9] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  
New tests
---------

  New tests have been introduced between xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576_BAT and xe-pw-136164v1_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - Statuses : 1 abort(s) 6 pass(s)
    - Exec time: [0.00, 0.03] s

  

Known issues
------------

  Here are the changes found in xe-pw-136164v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3:
    - {bat-bmg-1}:        [DMESG-WARN][10] ([Intel XE#2232]) -> [PASS][11] +63 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - {bat-bmg-1}:        [INCOMPLETE][12] ([Intel XE#2232]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_live_ktest@xe_bo:
    - {bat-bmg-1}:        [SKIP][14] ([Intel XE#2109]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-bmg-1/igt@xe_live_ktest@xe_bo.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-bmg-1/igt@xe_live_ktest@xe_bo.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109
  [Intel XE#2232]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2232


Build changes
-------------

  * Linux: xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576 -> xe-pw-136164v1

  IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576: 297dce9fadb6008b164278f5d702b4d7ba402576
  xe-pw-136164v1: 136164v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/index.html

--===============5695879896531406152==
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
<tr><td><b>Series:</b></td><td>Implement compression support on BMG</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136164/">https://patchwork.freedesktop.org/series/136164/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576_BAT -&gt; xe-pw-136164v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136164v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136164v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136164v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit} (NEW):</p>
<ul>
<li>{bat-bmg-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">ABORT</a></li>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576_BAT and xe-pw-136164v1_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:<ul>
<li>Statuses : 1 abort(s) 6 pass(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136164v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2232">Intel XE#2232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html">PASS</a> +63 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2232">Intel XE#2232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576/bat-bmg-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136164v1/bat-bmg-1/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576 -&gt; xe-pw-136164v1</li>
</ul>
<p>IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576: 297dce9fadb6008b164278f5d702b4d7ba402576<br />
  xe-pw-136164v1: 136164v1</p>

</body>
</html>

--===============5695879896531406152==--
