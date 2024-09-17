Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CD4CAC593
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C484910E4DC;
	Tue, 17 Sep 2024 17:44:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888E010E4DC;
 Tue, 17 Sep 2024 17:44:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4823921368836207765=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/xe2=3A_Extend_performance?=
 =?utf-8?q?_tuning_to_media_GT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 17:44:20 -0000
Message-ID: <172659506054.1023055.5163950302447487122@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917165400.40592-1-gustavo.sousa@intel.com>
In-Reply-To: <20240917165400.40592-1-gustavo.sousa@intel.com>
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

--===============4823921368836207765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Extend performance tuning to media GT
URL   : https://patchwork.freedesktop.org/series/138776/
State : failure

== Summary ==

CI Bug Log - changes from xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3_BAT -> xe-pw-138776v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138776v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138776v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138776v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4] +5 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:
    - bat-bmg-1:          [PASS][5] -> [DMESG-WARN][6] +6 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][7] -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_live_ktest@xe_dma_buf:
    - {bat-bmg-2}:        [PASS][9] -> [SKIP][10] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@load:
    - {bat-bmg-2}:        [PASS][11] -> [DMESG-WARN][12] +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-bmg-2/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-bmg-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-138776v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-3:
    - bat-bmg-1:          [PASS][13] -> [DMESG-WARN][14] ([Intel XE#877]) +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-3.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [PASS][17] -> [SKIP][18] ([Intel XE#1192]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8022 -> IGT_8023
  * Linux: xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3 -> xe-pw-138776v1

  IGT_8022: 2d82f767a959d58c04ff3876d59d67924208d4ef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3: 38e1b615fb395b928e514108e908cd6edf3d34c3
  xe-pw-138776v1: 138776v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/index.html

--===============4823921368836207765==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Extend performance tuning to media GT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138776/">https://patchwork.freedesktop.org/series/138776/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3_BAT -&gt; xe-pw-138776v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138776v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138776v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138776v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138776v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138776v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8022 -&gt; IGT_8023</li>
<li>Linux: xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3 -&gt; xe-pw-138776v1</li>
</ul>
<p>IGT_8022: 2d82f767a959d58c04ff3876d59d67924208d4ef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3: 38e1b615fb395b928e514108e908cd6edf3d34c3<br />
  xe-pw-138776v1: 138776v1</p>

</body>
</html>

--===============4823921368836207765==--
