Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE07C10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF0310E8EC;
	Thu,  7 Dec 2023 15:50:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA1A410E8EC;
 Thu,  7 Dec 2023 15:50:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5BDB2AADED;
 Thu,  7 Dec 2023 15:50:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0472203288598685883=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_R?=
 =?utf-8?q?evert_=22FIXME=3A_drm/i915=3A_avoid_taking_the_uncore_lock_for_xe?=
 =?utf-8?q?=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Date: Thu, 07 Dec 2023 15:50:04 -0000
Message-ID: <170196420437.28719.7334763929209645258@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207130106.1676807-1-luciano.coelho@intel.com>
In-Reply-To: <20231207130106.1676807-1-luciano.coelho@intel.com>
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

--===============0472203288598685883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] Revert "FIXME: drm/i915: avoid taking the uncore lock for xe"
URL   : https://patchwork.freedesktop.org/series/127494/
State : success

== Summary ==

CI Bug Log - changes from xe-557-668d13abebbbc3812de86be1f8477475e1d90728_BAT -> xe-pw-127494v1_BAT
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

  Here are the changes found in xe-pw-127494v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#480]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [DMESG-WARN][5] ([Intel XE#282] / [i915#2017]) -> [PASS][6] +5 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [DMESG-FAIL][7] ([Intel XE#282] / [i915#2017]) -> [FAIL][8] ([Intel XE#400] / [Intel XE#616]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-557-668d13abebbbc3812de86be1f8477475e1d90728 -> xe-pw-127494v1

  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-557-668d13abebbbc3812de86be1f8477475e1d90728: 668d13abebbbc3812de86be1f8477475e1d90728
  xe-pw-127494v1: 127494v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/index.html

--===============0472203288598685883==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] Revert &quot;FIXME: drm/i915: avoid taking the uncore lock for xe&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127494/">https://patchwork.freedesktop.org/series/127494/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-557-668d13abebbbc3812de86be1f8477475e1d90728_BAT -&gt; xe-pw-127494v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127494v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-557-668d13abebbbc3812de86be1f8477475e1d90728/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127494v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-557-668d13abebbbc3812de86be1f8477475e1d90728 -&gt; xe-pw-127494v1</li>
</ul>
<p>IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-557-668d13abebbbc3812de86be1f8477475e1d90728: 668d13abebbbc3812de86be1f8477475e1d90728<br />
  xe-pw-127494v1: 127494v1</p>

</body>
</html>

--===============0472203288598685883==--
