Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6763DCA5505
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 08:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056D610E480;
	Wed, 13 Sep 2023 08:26:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF86010E480;
 Wed, 13 Sep 2023 08:26:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CD26CAA917;
 Wed, 13 Sep 2023 08:26:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3136792986953525891=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Wed, 13 Sep 2023 08:26:11 -0000
Message-ID: <169459357183.31250.2770445986786777641@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230912195945.7-1-francois.dugast@intel.com>
In-Reply-To: <20230912195945.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Use_Xe_as?=
 =?utf-8?q?sert_macros_instead_of_XE=5FWARN=5FON_macro_=28rev7=29?=
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

--===============3136792986953525891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use Xe assert macros instead of XE_WARN_ON macro (rev7)
URL   : https://patchwork.freedesktop.org/series/122906/
State : failure

== Summary ==

CI Bug Log - changes from xe-369-da184d0771450c366fa6499d42b49eba733a67f8_BAT -> xe-pw-122906v7_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-122906v7_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-122906v7_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-122906v7_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_evict@evict-beng-small-external:
    - bat-adlp-7:         [SKIP][1] ([Intel XE#261]) -> [SKIP][2] +15 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  
Known issues
------------

  Here are the changes found in xe-pw-122906v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][3] ([Intel XE#400])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([i915#1072]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#483]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][6] ([Intel XE#480]) -> [PASS][7] +2 other tests pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [TIMEOUT][8] ([Intel XE#430]) -> [PASS][9] +2 other tests pass
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [INCOMPLETE][10] ([Intel XE#545]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [TIMEOUT][12] ([Intel XE#430]) -> [FAIL][13] ([Intel XE#400])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - bat-dg2-oem2:       [DMESG-FAIL][14] ([Intel XE#530]) -> [FAIL][15] ([Intel XE#400])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html

  
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/430
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/530
  [Intel XE#545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/545
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072


Build changes
-------------

  * IGT: IGT_7482 -> IGT_7483
  * Linux: xe-369-da184d0771450c366fa6499d42b49eba733a67f8 -> xe-pw-122906v7

  IGT_7482: beccb244183d5839c2464b856cd0b541f105e2ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7483: 7483
  xe-369-da184d0771450c366fa6499d42b49eba733a67f8: da184d0771450c366fa6499d42b49eba733a67f8
  xe-pw-122906v7: 122906v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/index.html

--===============3136792986953525891==
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
<tr><td><b>Series:</b></td><td>Use Xe assert macros instead of XE_WARN_ON macro (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122906/">https://patchwork.freedesktop.org/series/122906/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-369-da184d0771450c366fa6499d42b49eba733a67f8_BAT -&gt; xe-pw-122906v7_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-122906v7_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-122906v7_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-122906v7_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-beng-small-external:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-122906v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/545">Intel XE#545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-369-da184d0771450c366fa6499d42b49eba733a67f8/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122906v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7482 -&gt; IGT_7483</li>
<li>Linux: xe-369-da184d0771450c366fa6499d42b49eba733a67f8 -&gt; xe-pw-122906v7</li>
</ul>
<p>IGT_7482: beccb244183d5839c2464b856cd0b541f105e2ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7483: 7483<br />
  xe-369-da184d0771450c366fa6499d42b49eba733a67f8: da184d0771450c366fa6499d42b49eba733a67f8<br />
  xe-pw-122906v7: 122906v7</p>

</body>
</html>

--===============3136792986953525891==--
