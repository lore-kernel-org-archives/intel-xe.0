Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0686C56208
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 15:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D43310E806;
	Fri, 20 Feb 2026 15:13:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E8710E7F5;
 Fri, 20 Feb 2026 15:13:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6612352940752342843=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/vrr=3A_partial_rev?=
 =?utf-8?q?ert_of_dda7dcd9da73c5327aef42b89f0519bb51e84217?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Benjamin Tissoires" <bentiss@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Feb 2026 15:13:13 -0000
Message-ID: <177160039339.270884.7682177605075909061@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260218-wip-fix-iris-plus-v1-1-e6b969defd6d@kernel.org>
In-Reply-To: <20260218-wip-fix-iris-plus-v1-1-e6b969defd6d@kernel.org>
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

--===============6612352940752342843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vrr: partial revert of dda7dcd9da73c5327aef42b89f0519bb51e84217
URL   : https://patchwork.freedesktop.org/series/161891/
State : failure

== Summary ==

CI Bug Log - changes from xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1_BAT -> xe-pw-161891v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161891v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161891v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161891v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-wcl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-wcl-2/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-wcl-2/igt@kms_force_connector_basic@force-connector-state.html
    - bat-ptl-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-ptl-2:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html
    - bat-wcl-1:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-wcl-1/igt@kms_hdmi_inject@inject-audio.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-wcl-1/igt@kms_hdmi_inject@inject-audio.html

  
Known issues
------------

  Here are the changes found in xe-pw-161891v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][9] ([Intel XE#2229])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][10] ([Intel XE#7249]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][12] ([Intel XE#6506]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][14] ([Intel XE#6520]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249


Build changes
-------------

  * Linux: xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1 -> xe-pw-161891v1

  IGT_8764: 8764
  xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1: 84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1
  xe-pw-161891v1: 161891v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/index.html

--===============6612352940752342843==
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
<tr><td><b>Series:</b></td><td>drm/i915/vrr: partial revert of dda7dcd9da73c5327aef42b89f0519bb51e84217</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161891/">https://patchwork.freedesktop.org/series/161891/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1_BAT -&gt; xe-pw-161891v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161891v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161891v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161891v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-wcl-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-wcl-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-wcl-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-wcl-1/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161891v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1 -&gt; xe-pw-161891v1</li>
</ul>
<p>IGT_8764: 8764<br />
  xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1: 84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1<br />
  xe-pw-161891v1: 161891v1</p>

</body>
</html>

--===============6612352940752342843==--
