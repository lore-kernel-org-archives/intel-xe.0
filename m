Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F115C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 02:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E58A10E4A0;
	Tue,  7 Nov 2023 02:17:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 82AE810E4A0;
 Tue,  7 Nov 2023 02:17:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 684A0A7DFB;
 Tue,  7 Nov 2023 02:17:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5260309466868886298=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruthuvikas Ravikumar" <ruthuvikas.ravikumar@intel.com>
Date: Tue, 07 Nov 2023 02:17:56 -0000
Message-ID: <169932347638.21168.4617889223689481517@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231107012726.1972541-1-ruthuvikas.ravikumar@intel.com>
In-Reply-To: <20231107012726.1972541-1-ruthuvikas.ravikumar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Add_mocs_kunit_=28rev8=29?=
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

--===============5260309466868886298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add mocs kunit (rev8)
URL   : https://patchwork.freedesktop.org/series/124926/
State : success

== Summary ==

CI Bug Log - changes from xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b_BAT -> xe-pw-124926v8_BAT
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

  Here are the changes found in xe-pw-124926v8_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [TIMEOUT][1] ([Intel XE#530])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][2] ([Intel XE#545]) +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#692]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
    - bat-adlp-7:         [FAIL][5] ([i915#2346]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][7] ([Intel XE#524]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#524]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - bat-dg2-oem2:       [TIMEOUT][11] ([Intel XE#530]) -> [FAIL][12] ([Intel XE#400] / [Intel XE#616])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [INCOMPLETE][13] ([Intel XE#282] / [Intel XE#749]) -> [TIMEOUT][14] ([Intel XE#430])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:
    - bat-dg2-oem2:       [INCOMPLETE][15] ([Intel XE#282] / [Intel XE#545]) -> [TIMEOUT][16] ([Intel XE#430])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/430
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/530
  [Intel XE#545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/545
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/692
  [Intel XE#749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/749
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * Linux: xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b -> xe-pw-124926v8

  IGT_7574: 0485a4bf66f69aaf7244a3e689402b522f636780 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b: 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b
  xe-pw-124926v8: 124926v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/index.html

--===============5260309466868886298==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add mocs kunit (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124926/">https://patchwork.freedesktop.org/series/124926/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b_BAT -&gt; xe-pw-124926v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124926v8_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/545">Intel XE#545</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/692">Intel XE#692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/749">Intel XE#749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/545">Intel XE#545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v8/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b -&gt; xe-pw-124926v8</li>
</ul>
<p>IGT_7574: 0485a4bf66f69aaf7244a3e689402b522f636780 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b: 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b<br />
  xe-pw-124926v8: 124926v8</p>

</body>
</html>

--===============5260309466868886298==--
