Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9C2EEB570
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 23:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0E810E21D;
	Fri,  8 Sep 2023 23:38:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25CE510E21A;
 Fri,  8 Sep 2023 23:38:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EE7F7AADF2;
 Fri,  8 Sep 2023 23:38:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3320841359625255489=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 08 Sep 2023 23:38:17 -0000
Message-ID: <169421629796.14898.11639742931311196177@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230908225227.1276610-1-lucas.demarchi@intel.com>
In-Reply-To: <20230908225227.1276610-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/mm?=
 =?utf-8?q?io=3A_Account_for_GSI_offset_when_checking_ranges?=
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

--===============3320841359625255489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmio: Account for GSI offset when checking ranges
URL   : https://patchwork.freedesktop.org/series/123466/
State : failure

== Summary ==

CI Bug Log - changes from xe-364-e51e857ffad411e1b78821866e9f02187345a11a_BAT -> xe-pw-123466v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123466v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123466v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123466v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-plain-flip@b-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@b-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@b-dp3.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3:
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-FAIL][4] +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3:
    - bat-dg2-oem2:       [PASS][5] -> [DMESG-WARN][6] +4 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#608]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#483]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  
Known issues
------------

  Here are the changes found in xe-pw-123466v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          NOTRUN -> [SKIP][11] ([Intel XE#538]) +33 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          NOTRUN -> [SKIP][12] ([Intel XE#539]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#541]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [PASS][14] -> [FAIL][15] ([Intel XE#480]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip@d-dp3:
    - bat-dg2-oem2:       [PASS][16] -> [FAIL][17] ([Intel XE#548]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@d-dp3.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@d-dp3.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          NOTRUN -> [SKIP][18] ([Intel XE#540]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][19] -> [DMESG-WARN][20] ([Intel XE#547]) +23 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-pvc-2:          NOTRUN -> [SKIP][21] ([Intel XE#537]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][22] -> [DMESG-FAIL][23] ([Intel XE#547]) +2 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][24] ([Intel XE#536])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@primary_page_flip:
    - bat-pvc-2:          NOTRUN -> [SKIP][25] ([Intel XE#535]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_psr@primary_page_flip.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][26] ([Intel XE#533]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][27] ([Intel XE#255])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][28] ([Intel XE#532])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@migrate:
    - bat-pvc-2:          NOTRUN -> [SKIP][29] ([Intel XE#483]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_live_ktest@migrate.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][30] ([Intel XE#531])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Possible fixes ####

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - bat-pvc-2:          [INCOMPLETE][31] ([Intel XE#526]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][33] ([Intel XE#400]) -> [DMESG-WARN][34] ([Intel XE#547]) +2 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#526]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/526
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/536
  [Intel XE#537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/537
  [Intel XE#538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/538
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#547]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/547
  [Intel XE#548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/548
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608


Build changes
-------------

  * IGT: IGT_7477 -> IGT_7478
  * Linux: xe-364-e51e857ffad411e1b78821866e9f02187345a11a -> xe-pw-123466v1

  IGT_7477: 7477
  IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-364-e51e857ffad411e1b78821866e9f02187345a11a: e51e857ffad411e1b78821866e9f02187345a11a
  xe-pw-123466v1: 123466v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/index.html

--===============3320841359625255489==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmio: Account for GSI offset when checking ranges</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123466/">https://patchwork.freedesktop.org/series/123466/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-364-e51e857ffad411e1b78821866e9f02187345a11a_BAT -&gt; xe-pw-123466v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123466v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123466v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123466v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@b-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@b-dp3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123466v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/538">Intel XE#538</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@d-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/548">Intel XE#548</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/547">Intel XE#547</a>) +23 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/537">Intel XE#537</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/547">Intel XE#547</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/536">Intel XE#536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/533">Intel XE#533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_live_ktest@migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_reset@virtual-close-fd-no-exec:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/526">Intel XE#526</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-364-e51e857ffad411e1b78821866e9f02187345a11a/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123466v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/547">Intel XE#547</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7477 -&gt; IGT_7478</li>
<li>Linux: xe-364-e51e857ffad411e1b78821866e9f02187345a11a -&gt; xe-pw-123466v1</li>
</ul>
<p>IGT_7477: 7477<br />
  IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-364-e51e857ffad411e1b78821866e9f02187345a11a: e51e857ffad411e1b78821866e9f02187345a11a<br />
  xe-pw-123466v1: 123466v1</p>

</body>
</html>

--===============3320841359625255489==--
