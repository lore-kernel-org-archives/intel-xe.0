Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE60C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 07:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A63810E790;
	Thu, 10 Apr 2025 07:07:13 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B140110E7AF;
 Thu, 10 Apr 2025 07:07:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2273191830352017173=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Use_migration_for?=
 =?utf-8?q?_display_GGTT_updates=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 07:07:12 -0000
Message-ID: <174426883271.54720.4677688787819974582@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407130449.1010470-1-dev@lankhorst.se>
In-Reply-To: <20250407130449.1010470-1-dev@lankhorst.se>
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

--===============2273191830352017173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use migration for display GGTT updates. (rev2)
URL   : https://patchwork.freedesktop.org/series/147326/
State : failure

== Summary ==

CI Bug Log - changes from xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8_BAT -> xe-pw-147326v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147326v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147326v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147326v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-lnl-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-adlp-7:         [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-bmg-2:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-atsm-2:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * {igt@xe_live_ktest@xe_migrate@xe_migrate_ggtt_kunit} (NEW):
    - bat-lnl-2:          NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_ggtt_kunit.html
    - bat-atsm-2:         NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_ggtt_kunit.html

  
New tests
---------

  New tests have been introduced between xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8_BAT and xe-pw-147326v2_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_migrate@xe_migrate_ggtt_kunit:
    - Statuses : 2 fail(s)
    - Exec time: [0.11, 0.18] s

  

Known issues
------------

  Here are the changes found in xe-pw-147326v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-userptr-rebind:
    - bat-adlp-vf:        [PASS][15] -> [ABORT][16] ([Intel XE#3970])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [PASS][17] -> [FAIL][18] ([Intel XE#2909])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8312 -> IGT_8311
  * Linux: xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8 -> xe-pw-147326v2

  IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8312: 8312
  xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8: c54633598106dbdb97f3aa589587b8176009b6d8
  xe-pw-147326v2: 147326v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/index.html

--===============2273191830352017173==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use migration for display GGTT updates. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147326/">https://patchwork.freedesktop.org/series/147326/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8_BAT -&gt; xe-pw-147326v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147326v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-147326v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-147326v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@xe_migrate@xe_migrate_ggtt_kunit} (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_ggtt_kunit.html">FAIL</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_ggtt_kunit.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8_BAT and xe-pw-147326v2_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_ggtt_kunit:<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.11, 0.18] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147326v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147326v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909">Intel XE#2909</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8312 -&gt; IGT_8311</li>
<li>Linux: xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8 -&gt; xe-pw-147326v2</li>
</ul>
<p>IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8312: 8312<br />
  xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8: c54633598106dbdb97f3aa589587b8176009b6d8<br />
  xe-pw-147326v2: 147326v2</p>

</body>
</html>

--===============2273191830352017173==--
