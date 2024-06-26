Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D6FC3064D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 05:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1F010E775;
	Wed, 26 Jun 2024 05:44:51 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EA610E775;
 Wed, 26 Jun 2024 05:44:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4297191361370942245=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_HDMI_PLL_Algorithm_for_SNPS/?=
 =?utf-8?q?C10PHY?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 05:44:50 -0000
Message-ID: <171938069061.159327.2074571084713567589@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626050056.3996349-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240626050056.3996349-1-ankit.k.nautiyal@intel.com>
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

--===============4297191361370942245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add HDMI PLL Algorithm for SNPS/C10PHY
URL   : https://patchwork.freedesktop.org/series/135396/
State : success

== Summary ==

CI Bug Log - changes from xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d_BAT -> xe-pw-135396v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-135396v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][1] ([i915#5274]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][3] ([Intel XE#324]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d -> xe-pw-135396v1

  IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d: edccdf441f1e061f81e0d1d172aa0f37511bbe4d
  xe-pw-135396v1: 135396v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v1/index.html

--===============4297191361370942245==
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
<tr><td><b>Series:</b></td><td>Add HDMI PLL Algorithm for SNPS/C10PHY</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135396/">https://patchwork.freedesktop.org/series/135396/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d_BAT -&gt; xe-pw-135396v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135396v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d -&gt; xe-pw-135396v1</li>
</ul>
<p>IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d: edccdf441f1e061f81e0d1d172aa0f37511bbe4d<br />
  xe-pw-135396v1: 135396v1</p>

</body>
</html>

--===============4297191361370942245==--
