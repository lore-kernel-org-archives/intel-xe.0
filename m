Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B53AC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 00:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42C110E141;
	Thu,  7 Dec 2023 00:18:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC8AE10E7A6;
 Thu,  7 Dec 2023 00:18:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9F726AADED;
 Thu,  7 Dec 2023 00:18:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3312868568667791778=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Thu, 07 Dec 2023 00:18:04 -0000
Message-ID: <170190828464.28720.14048503863337830123@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206172027.1184366-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231206172027.1184366-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Enable_co?=
 =?utf-8?q?mpression_handling_on_LNL=2E_=28rev6=29?=
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

--===============3312868568667791778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable compression handling on LNL. (rev6)
URL   : https://patchwork.freedesktop.org/series/126704/
State : failure

== Summary ==

CI Bug Log - changes from xe-557-668d13abebbbc3812de86be1f8477475e1d90728_BAT -> xe-pw-126704v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126704v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126704v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126704v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@bo:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-atsm-2/igt@xe_live_ktest@bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-atsm-2/igt@xe_live_ktest@bo.html

  * igt@xe_live_ktest@migrate@xe_migrate-xe_migrate_sanity_kunit:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-adlp-7/igt@xe_live_ktest@migrate@xe_migrate-xe_migrate_sanity_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-adlp-7/igt@xe_live_ktest@migrate@xe_migrate-xe_migrate_sanity_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-126704v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-leak:
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] ([Intel XE#524])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [PASS][7] -> [INCOMPLETE][8] ([Intel XE#868])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [PASS][9] -> [FAIL][10] ([Intel XE#999])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][11] ([Intel XE#480]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [DMESG-WARN][13] ([Intel XE#282] / [i915#2017]) -> [PASS][14] +5 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [DMESG-FAIL][15] ([Intel XE#282] / [i915#2017]) -> [FAIL][16] ([Intel XE#400] / [Intel XE#616]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/868
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-557-668d13abebbbc3812de86be1f8477475e1d90728 -> xe-pw-126704v6

  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-557-668d13abebbbc3812de86be1f8477475e1d90728: 668d13abebbbc3812de86be1f8477475e1d90728
  xe-pw-126704v6: 126704v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/index.html

--===============3312868568667791778==
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
<tr><td><b>Series:</b></td><td>Enable compression handling on LNL. (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126704/">https://patchwork.freedesktop.org/series/126704/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-557-668d13abebbbc3812de86be1f8477475e1d90728_BAT -&gt; xe-pw-126704v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126704v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126704v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126704v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-atsm-2/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-atsm-2/igt@xe_live_ktest@bo.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate@xe_migrate-xe_migrate_sanity_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-adlp-7/igt@xe_live_ktest@migrate@xe_migrate-xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-adlp-7/igt@xe_live_ktest@migrate@xe_migrate-xe_migrate_sanity_kunit.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126704v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_create@create-execqueues-leak:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-dg2-oem2/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-dg2-oem2/igt@xe_live_ktest@bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/868">Intel XE#868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-557-668d13abebbbc3812de86be1f8477475e1d90728 -&gt; xe-pw-126704v6</li>
</ul>
<p>IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-557-668d13abebbbc3812de86be1f8477475e1d90728: 668d13abebbbc3812de86be1f8477475e1d90728<br />
  xe-pw-126704v6: 126704v6</p>

</body>
</html>

--===============3312868568667791778==--
