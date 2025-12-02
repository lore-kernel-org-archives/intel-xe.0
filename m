Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B33D11719
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 16:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EA710E68B;
	Tue,  2 Dec 2025 16:58:38 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B677310E68B;
 Tue,  2 Dec 2025 16:58:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1519650297392426125=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Expose_new_?=
 =?utf-8?q?temperature_attributes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Dec 2025 16:58:37 -0000
Message-ID: <176469471773.50506.10884194743651913743@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251202145013.3273400-1-karthik.poosa@intel.com>
In-Reply-To: <20251202145013.3273400-1-karthik.poosa@intel.com>
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

--===============1519650297392426125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Expose new temperature attributes
URL   : https://patchwork.freedesktop.org/series/158384/
State : success

== Summary ==

CI Bug Log - changes from xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867_BAT -> xe-pw-158384v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-158384v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] ([Intel XE#623])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#455])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#288]) +32 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#255])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][7] ([Intel XE#2229])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][8] ([Intel XE#977])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][9] ([Intel XE#2838] / [Intel XE#979])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][10] ([Intel XE#979])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][11] ([Intel XE#3342])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][12] ([Intel XE#6519])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][13] ([Intel XE#6520])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_exec_queue_property@invalid-property:
    - bat-ptl-2:          [FAIL][14] ([Intel XE#6741]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-atsm-2:         [FAIL][16] ([Intel XE#6741]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-vm:        [FAIL][18] ([Intel XE#6741]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html
    - bat-ptl-1:          [FAIL][20] ([Intel XE#6741]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-1:          [FAIL][22] ([Intel XE#6741]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-ptl-vm:         [FAIL][24] ([Intel XE#6741]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html
    - bat-bmg-2:          [FAIL][26] ([Intel XE#6741]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-7:         [FAIL][28] ([Intel XE#6741]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-2:          [FAIL][30] ([Intel XE#6741]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [ABORT][32] ([Intel XE#6610]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-dg2-oem2/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#6610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6610
  [Intel XE#6741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6741
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8647 -> IGT_8649
  * Linux: xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867 -> xe-pw-158384v1

  IGT_8647: 8647
  IGT_8649: f76e05461c8d5938856ed75ac8668640946f9ecd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867: 4ffeb1fd1362e2148a7ada498cbaef7b1de27867
  xe-pw-158384v1: 158384v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/index.html

--===============1519650297392426125==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Expose new temperature attributes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158384/">https://patchwork.freedesktop.org/series/158384/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867_BAT -&gt; xe-pw-158384v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158384v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6741">Intel XE#6741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6741">Intel XE#6741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6741">Intel XE#6741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6741">Intel XE#6741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6741">Intel XE#6741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6741">Intel XE#6741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6741">Intel XE#6741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6741">Intel XE#6741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6741">Intel XE#6741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6610">Intel XE#6610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158384v1/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8647 -&gt; IGT_8649</li>
<li>Linux: xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867 -&gt; xe-pw-158384v1</li>
</ul>
<p>IGT_8647: 8647<br />
  IGT_8649: f76e05461c8d5938856ed75ac8668640946f9ecd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4179-4ffeb1fd1362e2148a7ada498cbaef7b1de27867: 4ffeb1fd1362e2148a7ada498cbaef7b1de27867<br />
  xe-pw-158384v1: 158384v1</p>

</body>
</html>

--===============1519650297392426125==--
