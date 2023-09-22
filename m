Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F69DE6FE22
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 13:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5EC10E665;
	Fri, 22 Sep 2023 13:04:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6090410E667;
 Fri, 22 Sep 2023 13:04:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5511CAADE1;
 Fri, 22 Sep 2023 13:04:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0359005802882583581=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Fri, 22 Sep 2023 13:04:12 -0000
Message-ID: <169538785231.5199.13707288079608285060@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Enable_re?=
 =?utf-8?q?mapped_display_page_table_on_Xe?=
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

--===============0359005802882583581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable remapped display page table on Xe
URL   : https://patchwork.freedesktop.org/series/124108/
State : failure

== Summary ==

CI Bug Log - changes from xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec_BAT -> xe-pw-124108v1_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-124108v1_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-124108v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-124108v1_BAT:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [INCOMPLETE][1] ([Intel XE#632]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-124108v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][3] ([Intel XE#400]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - bat-adlp-7:         NOTRUN -> [FAIL][4] ([Intel XE#400]) +29 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#679]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg2-oem2:       [SKIP][7] ([i915#2575]) -> [PASS][8] +49 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][9] ([Intel XE#524]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#678]) -> [PASS][12] +142 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [FAIL][13] ([Intel XE#722]) -> [PASS][14] +6 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][15] ([Intel XE#681]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][17] ([i915#2575]) -> [SKIP][18] ([Intel XE#623])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][19] ([i915#2575]) -> [SKIP][20] ([Intel XE#624])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [SKIP][21] ([i915#2575]) -> [FAIL][22] ([Intel XE#609]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#678]) -> [SKIP][24] ([Intel XE#423])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][25] ([i915#2575]) -> [SKIP][26] ([i915#5274])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#678]) -> [FAIL][28] ([Intel XE#608])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [SKIP][29] ([i915#2575]) -> [FAIL][30] ([Intel XE#400])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#678]) -> [SKIP][32] ([i915#1072]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#678]) -> [SKIP][34] ([Intel XE#672])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#678]) -> [SKIP][36] ([Intel XE#288]) +17 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][37] ([Intel XE#678]) -> [SKIP][38] ([Intel XE#255])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#678]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/678
  [Intel XE#679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/679
  [Intel XE#681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/681
  [Intel XE#722]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/722
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * IGT: IGT_7496 -> IGT_7497
  * Linux: xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec -> xe-pw-124108v1

  IGT_7496: 6a96d3ad178e468b74a58cc10dead2f57bc1558d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7497: 70d59545b989e3f4d3e66a97ce5e608729609a18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec: 6149acb947f2f8b65ee1a058982a5d6fce3124ec
  xe-pw-124108v1: 124108v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/index.html

--===============0359005802882583581==
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
<tr><td><b>Series:</b></td><td>Enable remapped display page table on Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124108/">https://patchwork.freedesktop.org/series/124108/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec_BAT -&gt; xe-pw-124108v1_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-124108v1_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-124108v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-124108v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124108v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) +29 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/679">Intel XE#679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> +142 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_live_ktest@bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/722">Intel XE#722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/681">Intel XE#681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124108v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7496 -&gt; IGT_7497</li>
<li>Linux: xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec -&gt; xe-pw-124108v1</li>
</ul>
<p>IGT_7496: 6a96d3ad178e468b74a58cc10dead2f57bc1558d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7497: 70d59545b989e3f4d3e66a97ce5e608729609a18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec: 6149acb947f2f8b65ee1a058982a5d6fce3124ec<br />
  xe-pw-124108v1: 124108v1</p>

</body>
</html>

--===============0359005802882583581==--
