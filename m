Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D74CCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 22:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D161510E382;
	Tue, 21 Oct 2025 22:31:50 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9631910E382;
 Tue, 21 Oct 2025 22:31:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6448327648915982487=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Enforce_DRM_scheduler_recla?=
 =?utf-8?q?im_rules?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 22:31:49 -0000
Message-ID: <176108590957.37893.8996224777719927219@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021213952.746900-1-matthew.brost@intel.com>
In-Reply-To: <20251021213952.746900-1-matthew.brost@intel.com>
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

--===============6448327648915982487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enforce DRM scheduler reclaim rules
URL   : https://patchwork.freedesktop.org/series/156283/
State : failure

== Summary ==

CI Bug Log - changes from xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687_BAT -> xe-pw-156283v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156283v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156283v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156283v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-bmg-1/igt@kms_force_connector_basic@force-connector-state.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-bmg-1/igt@kms_force_connector_basic@force-connector-state.html
    - bat-dg2-oem2:       [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-dg2-oem2/igt@kms_force_connector_basic@force-connector-state.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-dg2-oem2/igt@kms_force_connector_basic@force-connector-state.html
    - bat-ptl-1:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-ptl-2/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-ptl-2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-atsm-2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-atsm-2/igt@xe_module_load@load.html
    - bat-pvc-2:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-pvc-2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-pvc-2/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-adlp-7/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-adlp-7/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-156283v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-lnl-1:          [PASS][19] -> [ABORT][20] ([Intel XE#5087])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-lnl-1/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-lnl-1/igt@xe_module_load@load.html

  
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087


Build changes
-------------

  * Linux: xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 -> xe-pw-156283v1

  IGT_8594: 8594
  xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687: fb0f56ad8a2c9953c57c3337a72ccbf9c5050687
  xe-pw-156283v1: 156283v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/index.html

--===============6448327648915982487==
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
<tr><td><b>Series:</b></td><td>Enforce DRM scheduler reclaim rules</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156283/">https://patchwork.freedesktop.org/series/156283/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687_BAT -&gt; xe-pw-156283v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156283v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156283v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156283v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-bmg-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-bmg-1/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-dg2-oem2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-dg2-oem2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-atsm-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-pvc-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-pvc-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156283v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156283v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 -&gt; xe-pw-156283v1</li>
</ul>
<p>IGT_8594: 8594<br />
  xe-3961-fb0f56ad8a2c9953c57c3337a72ccbf9c5050687: fb0f56ad8a2c9953c57c3337a72ccbf9c5050687<br />
  xe-pw-156283v1: 156283v1</p>

</body>
</html>

--===============6448327648915982487==--
