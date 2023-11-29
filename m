Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766C6C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 12:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D4910E4F6;
	Wed, 29 Nov 2023 12:16:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 086CA10E4FB;
 Wed, 29 Nov 2023 12:16:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 00B2BA03D2;
 Wed, 29 Nov 2023 12:16:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0396942615115641984=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 29 Nov 2023 12:16:18 -0000
Message-ID: <170126017899.12090.9848927880088527437@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231129103706.329056-2-matthew.auld@intel.com>
In-Reply-To: <20231129103706.329056-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/mo?=
 =?utf-8?q?cs=3A_update_MOCS_table_for_xe2?=
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

--===============0396942615115641984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mocs: update MOCS table for xe2
URL   : https://patchwork.freedesktop.org/series/127036/
State : success

== Summary ==

CI Bug Log - changes from xe-530-d531f8914376330c90c46c3a251f426695722bd3_BAT -> xe-pw-127036v1_BAT
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

  Here are the changes found in xe-pw-127036v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([i915#2346])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#288]) +17 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [INCOMPLETE][4] ([Intel XE#282] / [Intel XE#749]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:
    - bat-dg2-oem2:       [INCOMPLETE][6] ([Intel XE#282] / [Intel XE#545]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][8] ([Intel XE#524]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][10] ([Intel XE#616] / [Intel XE#750]) -> [DMESG-FAIL][11] ([Intel XE#282] / [i915#2017])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [TIMEOUT][12] ([Intel XE#430] / [Intel XE#530]) -> [FAIL][13] ([Intel XE#400] / [Intel XE#616])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:
    - bat-dg2-oem2:       [TIMEOUT][14] ([Intel XE#530]) -> [FAIL][15] ([Intel XE#400] / [Intel XE#616])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/430
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/530
  [Intel XE#545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/545
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/749
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * Linux: xe-530-d531f8914376330c90c46c3a251f426695722bd3 -> xe-pw-127036v1

  IGT_7609: 72a759595100b8d167ca78cd2d62e9acd97e36bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-530-d531f8914376330c90c46c3a251f426695722bd3: d531f8914376330c90c46c3a251f426695722bd3
  xe-pw-127036v1: 127036v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/index.html

--===============0396942615115641984==
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
<tr><td><b>Series:</b></td><td>drm/xe/mocs: update MOCS table for xe2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127036/">https://patchwork.freedesktop.org/series/127036/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-530-d531f8914376330c90c46c3a251f426695722bd3_BAT -&gt; xe-pw-127036v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127036v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/749">Intel XE#749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/545">Intel XE#545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-530-d531f8914376330c90c46c3a251f426695722bd3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127036v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-530-d531f8914376330c90c46c3a251f426695722bd3 -&gt; xe-pw-127036v1</li>
</ul>
<p>IGT_7609: 72a759595100b8d167ca78cd2d62e9acd97e36bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-530-d531f8914376330c90c46c3a251f426695722bd3: d531f8914376330c90c46c3a251f426695722bd3<br />
  xe-pw-127036v1: 127036v1</p>

</body>
</html>

--===============0396942615115641984==--
