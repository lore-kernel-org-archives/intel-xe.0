Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8429EE3F3F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 23:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD9010E00E;
	Tue, 12 Sep 2023 23:25:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A88B10E00E;
 Tue, 12 Sep 2023 23:25:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 11AD1AADD7;
 Tue, 12 Sep 2023 23:25:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6140084254427948249=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Date: Tue, 12 Sep 2023 23:25:11 -0000
Message-ID: <169456111103.31797.13851198978107787319@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230912212843.681802-1-matthew.s.atwood@intel.com>
In-Reply-To: <20230912212843.681802-1-matthew.s.atwood@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_st?=
 =?utf-8?q?arting_with_=5Bv4=2C1/2=5D_drm/xe=3A_Add_infrastructure_for_per?=
 =?utf-8?q?_engine_tuning?=
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

--===============6140084254427948249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v4,1/2] drm/xe: Add infrastructure for per engine tuning
URL   : https://patchwork.freedesktop.org/series/123617/
State : success

== Summary ==

CI Bug Log - changes from xe-369-da184d0771450c366fa6499d42b49eba733a67f8_BAT -> xe-pw-123617v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-123617v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][1] ([Intel XE#400])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([i915#1072]) +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#483]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [TIMEOUT][4] ([Intel XE#430]) -> [PASS][5] +2 other tests pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [INCOMPLETE][6] -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [TIMEOUT][8] ([Intel XE#430]) -> [FAIL][9] ([Intel XE#400])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - bat-dg2-oem2:       [DMESG-FAIL][10] ([Intel XE#530]) -> [FAIL][11] ([Intel XE#400])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/430
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/530
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072


Build changes
-------------

  * Linux: xe-369-da184d0771450c366fa6499d42b49eba733a67f8 -> xe-pw-123617v1

  IGT_7482: beccb244183d5839c2464b856cd0b541f105e2ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-369-da184d0771450c366fa6499d42b49eba733a67f8: da184d0771450c366fa6499d42b49eba733a67f8
  xe-pw-123617v1: 123617v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/index.html

--===============6140084254427948249==
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
<tr><td><b>Series:</b></td><td>series starting with [v4,1/2] drm/xe: Add infrastructure for per engine tuning</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123617/">https://patchwork.freedesktop.org/series/123617/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-369-da184d0771450c366fa6499d42b49eba733a67f8_BAT -&gt; xe-pw-123617v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123617v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123617v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-369-da184d0771450c366fa6499d42b49eba733a67f8 -&gt; xe-pw-123617v1</li>
</ul>
<p>IGT_7482: beccb244183d5839c2464b856cd0b541f105e2ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-369-da184d0771450c366fa6499d42b49eba733a67f8: da184d0771450c366fa6499d42b49eba733a67f8<br />
  xe-pw-123617v1: 123617v1</p>

</body>
</html>

--===============6140084254427948249==--
