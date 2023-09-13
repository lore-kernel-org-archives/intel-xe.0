Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ABBEE0212
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 23:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0AB10E1DE;
	Wed, 13 Sep 2023 23:59:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C123610E1DE;
 Wed, 13 Sep 2023 23:59:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BE805AADF2;
 Wed, 13 Sep 2023 23:59:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2239159901313488623=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 13 Sep 2023 23:59:17 -0000
Message-ID: <169464955775.31252.4055605840518495708@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
In-Reply-To: <20230913231411.291933-8-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Separate_?=
 =?utf-8?q?display_and_tile_workarounds?=
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

--===============2239159901313488623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Separate display and tile workarounds
URL   : https://patchwork.freedesktop.org/series/123657/
State : success

== Summary ==

CI Bug Log - changes from xe-371-89b671db4d8e2c46f27044d39c69095f597290e5_BAT -> xe-pw-123657v1_BAT
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

  Here are the changes found in xe-pw-123657v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([Intel XE#539])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#423])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#423])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][4] -> [FAIL][5] ([Intel XE#480])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@xe_live_ktest@migrate:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#483]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-dg2-oem2/igt@xe_live_ktest@migrate.html

  * igt@xe_module_load@load:
    - bat-pvc-2:          [PASS][7] -> [INCOMPLETE][8] ([Intel XE#597])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-pvc-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-pvc-2/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#480]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-oem2:       [FAIL][11] -> [PASS][12] +2 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-dg2-oem2:       [DMESG-WARN][13] ([Intel XE#547]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-dg2-oem2/igt@kms_prop_blob@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-dg2-oem2/igt@kms_prop_blob@basic.html

  
#### Warnings ####

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [INCOMPLETE][15] -> [SKIP][16] ([Intel XE#483])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [Intel XE#547]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/547
  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597


Build changes
-------------

  * IGT: IGT_7485 -> IGT_7486
  * Linux: xe-371-89b671db4d8e2c46f27044d39c69095f597290e5 -> xe-pw-123657v1

  IGT_7485: 31ec677ca24e7ed86e35f367f40a29d3d9f51c06 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7486: afd9a940c8247291baadd1977fe881d4f2edf0c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-371-89b671db4d8e2c46f27044d39c69095f597290e5: 89b671db4d8e2c46f27044d39c69095f597290e5
  xe-pw-123657v1: 123657v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/index.html

--===============2239159901313488623==
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
<tr><td><b>Series:</b></td><td>Separate display and tile workarounds</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123657/">https://patchwork.freedesktop.org/series/123657/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-371-89b671db4d8e2c46f27044d39c69095f597290e5_BAT -&gt; xe-pw-123657v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123657v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-pvc-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-pvc-2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-dg2-oem2/igt@kms_prop_blob@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/547">Intel XE#547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-dg2-oem2/igt@kms_prop_blob@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@bo:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-371-89b671db4d8e2c46f27044d39c69095f597290e5/bat-dg2-oem2/igt@xe_live_ktest@bo.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123657v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7485 -&gt; IGT_7486</li>
<li>Linux: xe-371-89b671db4d8e2c46f27044d39c69095f597290e5 -&gt; xe-pw-123657v1</li>
</ul>
<p>IGT_7485: 31ec677ca24e7ed86e35f367f40a29d3d9f51c06 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7486: afd9a940c8247291baadd1977fe881d4f2edf0c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-371-89b671db4d8e2c46f27044d39c69095f597290e5: 89b671db4d8e2c46f27044d39c69095f597290e5<br />
  xe-pw-123657v1: 123657v1</p>

</body>
</html>

--===============2239159901313488623==--
